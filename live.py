from flask import Flask, request, jsonify, Response
import cv2
import numpy as np
from ultralytics import YOLO
import threading
import queue
from paddleocr import PaddleOCR

app = Flask(__name__)

model = YOLO('yolo.pt')
ocr = PaddleOCR(use_angle_cls=True, lang='en')

ocr_queue = queue.Queue()
result_queue = queue.Queue()
stop_event = threading.Event()  # Event to signal the thread to stop

def preprocess_image(image):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    gray = cv2.bilateralFilter(gray, 9, 75, 75)
    gray = cv2.equalizeHist(gray)
    coords = np.column_stack(np.where(gray > 0))
    angle = cv2.minAreaRect(coords)[-1]
    if angle < -45:
        angle = -(90 + angle)
    else:
        angle = -angle

    (h, w) = gray.shape[:2]
    center = (w // 2, h // 2)
    M = cv2.getRotationMatrix2D(center, angle, 1.0)
    gray = cv2.warpAffine(gray, M, (w, h), flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)

    grad_x = cv2.Sobel(gray, cv2.CV_16S, 1, 0, ksize=3)
    grad_y = cv2.Sobel(gray, cv2.CV_16S, 0, 1, ksize=3)
    abs_grad_x = cv2.convertScaleAbs(grad_x)
    abs_grad_y = cv2.convertScaleAbs(grad_y)
    edges = cv2.addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0)

    bw = cv2.adaptiveThreshold(edges, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)

    return bw

def recognize_text_from_plate():
    while not stop_event.is_set():
        try:
            plate_image = ocr_queue.get(timeout=1)
            if plate_image is None:
                continue
            result = ocr.ocr(plate_image, cls=True)
            detected_text = ''.join([line[1][0] for line in result[0]])
            result_queue.put(detected_text)
        except queue.Empty:
            continue
        except Exception as e:
            print(f"OCR recognition error: {e}")
            result_queue.put("")

@app.route('/start_live_ocr', methods=['POST'])
def start_live_ocr():
    if 'file' not in request.files:
        return jsonify({"error": "No file part in the request"}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    stream = file.stream
    while not stop_event.is_set():
        # Read a frame from the video stream
        ret, frame = stream.read()
        if not ret:
            break

        results = model(frame)
        detected_text = ""
        for result in results[0].boxes.data:
            x1, y1, x2, y2, score, class_id = result.cpu().numpy()
            if class_id == 0 and score > 0.25:
                number_plate = frame[int(y1):int(y2), int(x1):int(x2)]
                preprocessed_plate = preprocess_image(number_plate)
                ocr_queue.put(preprocessed_plate)

        if not result_queue.empty():
            detected_text = result_queue.get()

    return jsonify({"detected_text": detected_text})

@app.route('/stop_live_ocr', methods=['GET'])
def stop_live_ocr():
    stop_event.set()
    ocr_queue.put(None)
    return jsonify({"message": "Live OCR stopped"}), 200

if __name__ == '__main__':
    ocr_thread = threading.Thread(target=recognize_text_from_plate)
    ocr_thread.start()
    app.run(host='0.0.0.0', port=8000, debug=True)
    stop_event.set()
    ocr_queue.put(None)
    ocr_thread.join()

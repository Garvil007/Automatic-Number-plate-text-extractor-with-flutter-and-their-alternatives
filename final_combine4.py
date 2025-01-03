import cv2
import numpy as np
from ultralytics import YOLO
import threading
import queue
from transformers import TrOCRProcessor, VisionEncoderDecoderModel


model = YOLO('yolo.pt')

processor = TrOCRProcessor.from_pretrained("microsoft/trocr-base-printed", cache_dir="./trocr_cache")
model_trocr = VisionEncoderDecoderModel.from_pretrained("microsoft/trocr-base-printed", cache_dir="./trocr_cache")

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

def recognize_text_from_plate_trocr(ocr_queue, result_queue):
    while True:
        plate_image = ocr_queue.get()
        if plate_image is None:
            break
        try:

            plate_image_rgb = cv2.cvtColor(plate_image, cv2.COLOR_BGR2RGB)
            pixel_values = processor(images=plate_image_rgb, return_tensors="pt").pixel_values
            generated_ids = model_trocr.generate(pixel_values)
            detected_text = processor.batch_decode(generated_ids, skip_special_tokens=True)[0]
            result_queue.put(detected_text)
        except Exception as e:
            print(f"OCR recognition error: {e}")
            result_queue.put("")

def detect_number_plate(image_path):
    frame = cv2.imread(image_path)
    if frame is None:
        print(f"Failed to load image: {image_path}")
        return

    frame_resized = cv2.resize(frame, (640, 480))
    results = model(frame_resized)

    detected_text = ""

    for result in results[0].boxes.data:
        x1, y1, x2, y2, score, class_id = result.cpu().numpy()
        if class_id == 0 and score > 0.25:
            cv2.rectangle(frame_resized, (int(x1), int(y1)), (int(x2), int(y2)), (51, 51, 255), 2)
            cv2.putText(frame_resized, f"Plate: {score:.2f}", (int(x1), int(y1) - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (255, 255, 255), 2)

            number_plate = frame_resized[int(y1):int(y2), int(x1):int(x2)]
            preprocessed_plate = preprocess_image(number_plate)


            ocr_queue = queue.Queue()
            result_queue = queue.Queue()


            ocr_thread = threading.Thread(target=recognize_text_from_plate_trocr, args=(ocr_queue, result_queue))
            ocr_thread.start()


            ocr_queue.put(preprocessed_plate)
            ocr_queue.put(None)
            ocr_thread.join()

            if not result_queue.empty():
                detected_text = result_queue.get()
            break

    if detected_text:
        cv2.putText(frame_resized, detected_text, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1.0, (0, 255, 0), 2)

    cv2.imshow('Detected Number Plate', frame_resized)
    print(detected_text)
    cv2.waitKey(0)
    cv2.destroyAllWindows()


image_path = 'test_data/1.jpeg'
detect_number_plate(image_path)

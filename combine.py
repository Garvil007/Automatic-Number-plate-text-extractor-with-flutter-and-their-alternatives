import os
import cv2
import tempfile
from ultralytics import YOLO
from inference_sdk import InferenceHTTPClient
import dotenv

API_KEY = os.getenv('API_KEY')
CLIENT = InferenceHTTPClient(
    api_url="https://detect.roboflow.com",
    api_key=API_KEY
)

model = YOLO('yolo.pt')

def preprocess_image(image):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    bw = cv2.adaptiveThreshold(gray, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)
    return bw

def recognize_text_from_plate(plate_image):

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as temp:
        cv2.imwrite(temp.name, plate_image)
        temp_path = temp.name

    result = CLIENT.infer(temp_path, model_id="license-ocr-qqq6v/1")
    data = result
    predictions = data["predictions"]


    confidence_threshold = 0.71
    filtered_predictions = [pred for pred in predictions if pred["confidence"] >= confidence_threshold]

    sorted_predictions = sorted(filtered_predictions, key=lambda x: x["x"])


    detected_text = ''.join([pred["class"] for pred in sorted_predictions])
    return detected_text

def detect_number_plates():

    cap = cv2.VideoCapture(0)

    while True:

        ret, frame = cap.read()

        if not ret:
            print("Failed to capture frame")
            break


        results = model(frame)


        for result in results[0].boxes.data:
            x1, y1, x2, y2, score, class_id = result.cpu().numpy()
            if class_id == 0 and score > 0.25:
                cv2.rectangle(frame, (int(x1), int(y1)), (int(x2), int(y2)), (51, 51, 255), 2)
                cv2.putText(frame, f"Plate: {score:.2f}", (int(x1), int(y1) - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9,
                            (255, 255, 255), 2)

                number_plate = frame[int(y1):int(y2), int(x1):int(x2)]
                preprocessed_plate = preprocess_image(number_plate)
                detected_text = recognize_text_from_plate(preprocessed_plate)
                cv2.putText(frame, detected_text, (int(x1), int(y2) + 30), cv2.FONT_HERSHEY_SIMPLEX, 1.0, (0, 255, 0), 2)

        cv2.imshow('Webcam', frame)


        key = cv2.waitKey(1) & 0xFF
        if key == ord('q'):
            break


    cap.release()
    cv2.destroyAllWindows()


detect_number_plates()

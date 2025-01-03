# License Plate Recognition System

This repository contains three Python-based implementations for license plate detection and recognition using YOLO, OCR models, and Flask for live streaming API. The system can process live video streams, images, or files and extract the text from license plates.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Setup](#setup)
- [Usage](#usage)
  - [combine.py](#combinepy)
  - [final_combine4.py](#final_combine4py)
  - [live.py](#livepy)
  - [Flutter App Frontend](#flutter-app-frontend)
- [API Endpoints](#api-endpoints)
- [Acknowledgements](#acknowledgements)

---

## Overview

The project leverages object detection and OCR technologies to detect and recognize text on vehicle license plates. It includes three implementations:

1. **combine.py**: A YOLO-based real-time license plate detection script that integrates with a third-party OCR service.
2. **final_combine4.py**: A standalone script for detecting and recognizing license plates in a static image using the TrOCR model.
3. **live.py**: A Flask-based web service for live license plate detection and recognition using the PaddleOCR library.

---

## Features

- Real-time license plate detection and recognition.
- Static image processing.
- Support for multiple OCR backends (Roboflow, TrOCR, PaddleOCR).
- Web API for live detection using Flask.
- Multi-threaded OCR for enhanced performance.

---

## Project Structure

```
.
├── combine.py          # Real-time detection with Roboflow OCR integration
├── final_combine4.py   # Detection and recognition on static images with TrOCR
├── live.py             # Flask API for live license plate detection
├── requirements.txt    # Required Python dependencies
├── FlutterApp/         # Directory containing the Flutter app source code
└── README.md           # Project documentation
```

---

## Requirements

- Python 3.8+
- OpenCV
- ultralytics (YOLO)
- TrOCR
- PaddleOCR
- Flask
- Flutter SDK

---

## Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/license-plate-recognition.git
   cd license-plate-recognition
   ```

2. **Install dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

3. **Download models:**

   - Place the YOLO model (`yolo.pt`) in the root directory.
   - Ensure TrOCR and PaddleOCR models are downloaded and available.

4. **Set up environment variables:**

   Create a `.env` file with your API key (if using Roboflow OCR):

   ```env
   API_KEY=your_api_key_here
   ```

5. **Set up the Flutter App Frontend:**

   - Navigate to the `FlutterApp/` directory:
     ```bash
     cd FlutterApp
     ```
   - Ensure you have the Flutter SDK installed. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).
   - Run the following command to fetch dependencies:
     ```bash
     flutter pub get
     ```
   - To run the app on a local emulator or connected device:
     ```bash
     flutter run
     ```

---

## Usage

### combine.py

Run the script for real-time license plate detection using a webcam:

```bash
python combine.py
```

Press `q` to exit the webcam feed.

---

### final_combine4.py

Use this script to detect and recognize license plates from an image file:

```bash
python final_combine4.py
```

Replace `test_data/1.jpeg` with the path to your image.

---

### live.py

Start the Flask API server for live video processing:

```bash
python live.py
```

---

### Flutter App Frontend

The Flutter app serves as the frontend for the license plate detection system. To use it:

1. Ensure the backend Flask API is running locally or hosted.
2. Update the API endpoint in the Flutter app source code (found in `FlutterApp/lib/constants.dart`) to match your backend URL.
3. Build and run the Flutter app:

   ```bash
   cd FlutterApp
   flutter run
   ```

---

### API Endpoints

1. **Start Live OCR:**

   ```http
   POST /start_live_ocr
   ```
   - Upload a video file in the request body.

2. **Stop Live OCR:**

   ```http
   GET /stop_live_ocr
   ```
   - Terminates the live OCR process.

---

## Acknowledgements

- [YOLO](https://github.com/ultralytics/yolov5)
- [TrOCR](https://huggingface.co/microsoft/trocr-base-printed)
- [PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR)
- [Flask](https://flask.palletsprojects.com/)
- [Flutter](https://flutter.dev/)

---

## License

This project is licensed under Garvil Shah. See the `LICENSE` file for details.


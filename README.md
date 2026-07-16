# NutriLens AI

## AI-Powered Food Ingredient Analysis and Personalized Nutrition Assistant

NutriLens AI is a cross-platform mobile application that helps users understand the ingredients present in packaged food products. Using Optical Character Recognition (OCR) and Generative AI, the application analyzes food ingredients, explains their purpose, identifies potential health risks, and provides personalized recommendations based on each user's health profile.

The application is designed to simplify food labels and help users make healthier purchasing decisions.

---

# Project Overview

NutriLens AI enables users to:

- Create a personalized health profile.
- Scan packaged food labels using the device camera or gallery.
- Extract ingredient text using OCR.
- Analyze ingredients using AI.
- Understand the purpose and health effects of ingredients.
- Receive a health score for the scanned product.
- Get personalized recommendations based on health conditions and dietary preferences.
- Interact with an AI assistant to ask questions about scanned products.
- View scan history during the current application session.

---

# Features

## User Authentication

- User Registration
- Secure Login
- Persistent Login using SharedPreferences

## Personalized Health Profile

- Personal Details
- Physical Details
- Medical Conditions
- Food Allergies
- Dietary Preferences

## Food Label Scanner

- Capture images using the device camera
- Select images from the gallery
- OCR-based ingredient extraction using Google ML Kit

## AI Ingredient Analysis

- Ingredient identification
- Ingredient purpose
- Health effects
- Risk classification
- Overall health score
- Personalized recommendations

## AI Chat Assistant

- Context-aware conversations
- Product-specific questions and answers

## Dashboard

- Personalized dashboard
- Health insights
- Quick access to all application features

## Scan History

- View previously scanned products during the current application session.

---

# Technology Stack

## Frontend

- Flutter
- Dart

## Backend

- FastAPI
- Python

## Artificial Intelligence

- Google Gemini API

## Optical Character Recognition

- Google ML Kit Text Recognition

## Local Storage

- SharedPreferences

## Development Tools

- Visual Studio Code
- Android Emulator
- Git
- GitHub

# Project Architecture

The application follows a client-server architecture.

```
+-----------------------+
|     Flutter App       |
|  (Mobile Frontend)    |
+----------+------------+
           |
           |
           v
+-----------------------+
| Google ML Kit OCR     |
| Extracts Ingredients  |
+----------+------------+
           |
           |
           v
+-----------------------+
| FastAPI Backend       |
| Python REST API       |
+----------+------------+
           |
           |
           v
+-----------------------+
| Gemini AI             |
| Ingredient Analysis   |
| Personalized Advice   |
+----------+------------+
           |
           |
           v
+-----------------------+
| Flutter Application   |
| Displays Results      |
+-----------------------+
```

---

# Project Structure

```
NutriLens-AI
│
├── backend
│   ├── app
│   │   ├── api
│   │   ├── schemas
│   │   ├── services
│   │   ├── config.py
│   │   └── main.py
│   └── requirements.txt
│
├── frontend
│   ├── assets
│   ├── lib
│   │   ├── core
│   │   ├── database
│   │   ├── features
│   │   ├── models
│   │   └── services
│   └── pubspec.yaml
│
├── docs
│   └── screenshots
│
└── README.md
```

---

# Installation

## Clone the Repository

```bash
git clone https://github.com/thanmayee2205/NutriLens-AI.git
```

---

## Frontend

```bash
cd frontend
flutter pub get
flutter run
```

---

## Backend

```bash
cd backend
pip install -r requirements.txt
uvicorn app.main:app --reload
```

---

# Screenshots

The application screenshots are available in:

```
docs/screenshots/
```

They demonstrate the following application screens:

- Splash Screen
- Sign Up
- Dashboard
- Health Profile
- Scanner
- OCR Result
- AI Analysis
- AI Chat
- Scan History

---

# Future Enhancements

- Persistent scan history across application restarts.
- Barcode scanning support.
- Nutrition facts analysis.
- Cloud synchronization.
- Multi-language support.
- Personalized dietary plans.
- Product comparison.
- Wearable device integration.

---

# Author

**Thanmayee Reddy**

GitHub:

https://github.com/thanmayee2205

---

# License

This project is intended for educational and portfolio purposes.
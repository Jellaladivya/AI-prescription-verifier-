# AI Prescription Verifier (Streamlit Version)

This is an AI-powered medical prescription verification system built with Python and Streamlit. It uses Optical Character Recognition (OCR) to parse prescription details from images, and then leverages the Gemini API to analyze drug interactions, verify dosages, and suggest safer alternatives.

## Setup Instructions

### 1. Prerequisites
- Python 3.8+ installed.
- Tesseract OCR engine installed on your system.
  - **macOS:** `brew install tesseract`
  - **Ubuntu:** `sudo apt-get install tesseract-ocr`
  - **Windows:** Download from the [Tesseract at UB Mannheim repository](https://github.com/UB-Mannheim/tesseract/wiki). Make sure to add the installation path to your system's `PATH` environment variable.

### 2. Create a Virtual Environment
It's highly recommended to run the project in a virtual environment to manage dependencies.

```bash
# Create the virtual environment
python -m venv venv

# Activate it
# On macOS/Linux:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

### 3. Install Dependencies
Install all the required Python packages from the `requirements.txt` file.
```bash
pip install -r requirements.txt
```

### 4. Set Up Environment Variables
Create a file named `.env` in the root of the project directory by copying the example file.
```bash
cp .env.example .env
```
Now, open the `.env` file with a text editor and add your Google Gemini API key.
```
API_KEY="YOUR_GEMINI_API_KEY_HERE"
```

## How to Run the Application

Once you have completed the setup, you can run the Streamlit app with the following command from your terminal:
```bash
streamlit run app.py
```
Your default web browser should open a new tab with the application running.

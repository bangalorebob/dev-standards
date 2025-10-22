"""
WSGI Configuration Template
Based on successful flask-lab PythonAnywhere deployment
Usage: Copy to PythonAnywhere WSGI file and update variables
"""
import sys
import os

# Update this with your actual username
USERNAME = "YOUR_USERNAME"

# Update this with your project name
PROJECT_NAME = "YOUR_PROJECT_NAME"

# Add your project directory to sys.path
path = f'/home/{USERNAME}/{PROJECT_NAME}'
if path not in sys.path:
    sys.path.insert(0, path)

# Set working directory
os.chdir(path)

from app import app as application

if __name__ == "__main__":
    application.run()
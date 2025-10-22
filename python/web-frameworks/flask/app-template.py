""" Flask Application Template
Based on successful flask-lab implementation
Usage: Copy and modify for new Flask projects """

from flask import Flask, request, redirect, url_for, render_template
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'dev-secret-key-change-in-production')

# Phase/Version configuration - single source of truth
CURRENT_PHASE = {
    'name': 'Project Name: Phase X',
    'version': '1.0.0',  # Follow semantic versioning
    'description': 'Brief description of current phase',
    'slug': 'project-phase-slug',
    'features': [
        "Feature 1 description",
        "Feature 2 description",
        "Feature 3 description"
    ]
}

@app.context_processor
def inject_phase_info():
    """Make phase information available to all templates
    Based on flask-lab context processor pattern"""
    return {
        'current_phase': CURRENT_PHASE,
        'phase_info': CURRENT_PHASE['name']
    }

@app.route("/")
def home():
    return render_template('home.html')

@app.route("/health")
def health_check():
    """Health check endpoint for deployment monitoring
    Based on flask-lab monitoring implementation"""
    from datetime import datetime
    import platform

    return {
        "status": "healthy",
        "phase": CURRENT_PHASE['slug'],
        "version": CURRENT_PHASE['version'],
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "environment": {
            "python_version": platform.python_version(),
            "platform": platform.system(),
            "flask_env": os.environ.get('FLASK_ENV', 'production')
        }
    }

if __name__ == "__main__":
    debug_mode = os.environ.get('FLASK_ENV') == 'development'
    app.run(debug=debug_mode, host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))

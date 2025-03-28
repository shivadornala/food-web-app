FROM python:3.9-slim

WORKDIR /app

# Copy requirements file first (to use Docker cache efficiently)
COPY requirements.txt ./

# Install dependencies including gunicorn
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy the rest of the application
COPY . .

# Expose the correct port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV PYTHONUNBUFFERED=1

# Use Gunicorn as the entry point
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]


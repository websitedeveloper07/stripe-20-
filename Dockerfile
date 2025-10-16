# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app
COPY app.py .

# Expose the port Render will use
EXPOSE 8000

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Command to run the application with gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]

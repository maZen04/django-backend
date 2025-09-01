<<<<<<< HEAD
# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code into the container at /app
COPY . .

# Expose the port that Gunicorn will run on
EXPOSE 8000

# Run Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi:application"]
=======
# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set environment variables to optimize Python behavior
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies (optional, but recommended for production)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Run database migrations and start the server (optional for build-time)
# You may prefer to run these commands only at runtime in docker-compose
# RUN python manage.py migrate

# Start the Django development server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# >>>>>>> cb1b3be (Add Dockerfile and compose.yaml for Defang deployment)

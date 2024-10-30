# Use the official Python image from Docker Hub
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the required packages
RUN apt-get update && apt-get install -y python3-distutils && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code to the container
COPY . .

# Specify the command to run your application
CMD ["python", "app.py"]

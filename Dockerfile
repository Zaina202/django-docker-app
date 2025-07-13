# Base image
FROM python:3.12-slim-bookworm

# Metadata
LABEL maintainer="Chinedu Olebu"

# Improve logging
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies for mysqlclient
RUN apt-get update \
    && apt-get install -y \
        gcc \
        default-libmysqlclient-dev \
        pkg-config \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Upgrade pip and install Python packages
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port
EXPOSE 8000

ENV PYTHONUNBUFFERED=1

# Start the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

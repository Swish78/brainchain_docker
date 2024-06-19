# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN useradd -m -s /bin/bash appuser

RUN usermod -aG sudo appuser

RUN echo 'appuser:brainchain@1234' | chpasswd

USER appuser

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "-c", "import django; print(django.get_version())"]

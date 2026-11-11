
# Lightweight Python base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies for pyodbc
RUN apt-get update -o Acquire::Retries=3 && \
    apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    unixodbc-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy dependency file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source
COPY . .

# Expose FastAPI port
EXPOSE 8000

# Start FastAPI application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

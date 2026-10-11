FROM python:3.11-slim

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app/backend \
    PORT=7860

# System libraries for PyTorch & FAISS
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgomp1 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python requirements
COPY backend/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy backend & frontend source code
COPY backend ./backend
COPY frontend ./frontend

# Expose default port (7860 for Hugging Face Spaces / cloud environments)
EXPOSE 7860

# Start FastAPI application
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-7860} --app-dir backend"]

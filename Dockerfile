FROM python:3.11-slim

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app/backend \
    PORT=10000 \
    HF_HOME=/app/.cache/huggingface \
    TRANSFORMERS_CACHE=/app/.cache/huggingface/transformers \
    TRANSFORMERS_OFFLINE=1

# System libraries for PyTorch & FAISS
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python requirements (CPU-only PyTorch first to prevent CUDA bloat and Render 512MB OOM)
COPY backend/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu && \
    pip install --no-cache-dir -r requirements.txt

# Pre-download tokenizer + model config into image during BUILD (so no HF download at runtime)
# This bakes ~90MB of HF files into the image layer — avoids runtime OOM from HF downloads
RUN python -c "\
from transformers import AutoTokenizer, AutoModel; \
model_name = 'sentence-transformers/all-MiniLM-L12-v2'; \
AutoTokenizer.from_pretrained(model_name); \
AutoModel.from_pretrained(model_name); \
print('HuggingFace model cached successfully')"

# Copy backend & frontend source code
COPY backend ./backend
COPY frontend ./frontend

# Expose port (10000 for Render / cloud web services)
EXPOSE 10000

# Start FastAPI application with single worker to fit within 512MB RAM limit
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-10000} --app-dir backend --workers 1"]

FROM python:3.11-slim

# ── Hugging Face Spaces requires a non-root user ──────────────────────────────
RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# ── App environment ────────────────────────────────────────────────────────────
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/home/user/app/backend \
    PORT=7860 \
    TRANSFORMERS_OFFLINE=1 \
    HF_DATASETS_OFFLINE=1

# System library needed by FAISS
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*
USER user

WORKDIR /home/user/app

# ── Install Python deps (CPU-only PyTorch to keep image lean) ─────────────────
COPY --chown=user backend/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu && \
    pip install --no-cache-dir -r requirements.txt

# ── Copy source (no frontend – Vercel handles that now) ───────────────────────
COPY --chown=user backend ./backend

# ── Expose Spaces port ────────────────────────────────────────────────────────
EXPOSE 7860

# ── Start FastAPI ─────────────────────────────────────────────────────────────
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-7860} --app-dir backend --workers 1"]

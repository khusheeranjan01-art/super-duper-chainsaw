"""
app.py — Hugging Face Gradio SDK entry point
FastAPI backend ko Gradio ke andar mount kiya gaya hai.
HF Spaces is file ko automatically run karta hai.
"""
import sys
import os

# backend/ folder ko Python path mein daalo
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "backend"))

import gradio as gr

# FastAPI app import (backend/main.py se)
from main import app as fastapi_app

# ── Minimal Gradio UI (sirf "API running" message) ────────────────────────────
# Asli UI Vercel pe hai; yeh Space sirf backend API serve karta hai.
with gr.Blocks(title="Resume & Internship Matcher — API") as demo:
    gr.Markdown(
        """
        # 🎯 Resume & Internship Matcher — API Backend
        **Yeh Space sirf API backend hai.**
        
        Frontend Vercel pe deploy hai — wahi pe jaake use karo.
        
        | Endpoint | Description |
        |---|---|
        | `GET /api/health` | Health check |
        | `POST /api/match` | Resume matching |
        | `GET /api/categories` | All job categories |
        | `POST /api/recruiter/screen` | Recruiter screening |
        | `POST /api/coach` | AI career coach |
        """
    )

# ── FastAPI ke andar Gradio mount karo ────────────────────────────────────────
# Ab FastAPI /api/* routes + Gradio UI /gradio/ pe available hai
app = gr.mount_gradio_app(fastapi_app, demo, path="/gradio")

# ── Local development ke liye ─────────────────────────────────────────────────
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=7860)

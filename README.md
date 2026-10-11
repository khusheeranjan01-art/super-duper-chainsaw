---
title: Super Duper Chainsaw
emoji: ⚡
colorFrom: yellow
colorTo: blue
sdk: gradio
sdk_version: 6.30.0
app_file: app.py
pinned: false
---

# 🎯 AI-Powered Resume & Internship Matching Platform

[![CI/CD Pipeline](https://github.com/khusheeranjan01-art/super-duper-chainsaw/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/khusheeranjan01-art/super-duper-chainsaw/actions/workflows/ci-cd.yml)
![FastAPI](https://img.shields.io/badge/FastAPI-0.100+-green.svg)
![PyTorch](https://img.shields.io/badge/PyTorch-2.0+-orange.svg)
![Gradio](https://img.shields.io/badge/Gradio-SDK-blue.svg)

An intelligent, multi-tier recruitment and internship matching engine combining **Deep Learning (PyTorch)**, **Dense Vector Retrieval (FAISS)**, **Sentence-Transformers**, and **Google Gemini LLM** for deep applicant analysis, skill-gap recommendations, and candidate screening.

---

## 🏛️ System Architecture & Cloud Deployment Strategy

```
┌──────────────────────────────────────────────┐
│  1. Frontend Client Layer (Vercel CDN)       │
│     - Responsive Web UI (HTML5, CSS3, JS)   │
│     - Applicant & Recruiter Dashboards       │
│     - Global Low-Latency CDN Edge Delivery   │
└──────────────────────┬───────────────────────┘
                       │ HTTPS REST API Calls
                       ▼
┌──────────────────────────────────────────────┐
│  2. Hugging Face Spaces (Gradio SDK Backend) │
│     - FastAPI App Mounted via Gradio         │
│     - Custom PyTorch Dual-Encoder Matcher    │
│     - FAISS Vector Similarity Index          │
│     - Runs Free on CPU Tier                  │
└──────────────────────┬───────────────────────┘
                       │ Secure LLM Invocations
                       ▼
┌──────────────────────────────────────────────┐
│  3. External AI Integration Layer            │
│     - Google Gemini AI (LLM Analysis)        │
│     - Zero-Secret Leakage via Cloud Secrets  │
└──────────────────────────────────────────────┘
```

---

## 🚀 Key Features

* **Bi-Encoder Deep Matcher:** Custom PyTorch model trained on domain taxonomy and contextual resume embeddings.
* **Vector Semantic Search:** Dense FAISS index over internship postings for sub-millisecond retrieval.
* **LLM Career Coach & Insights:** Integrated Google Gemini LLM generating personalized career advice and skill gap roadmaps.
* **Dual Roles:**
  * **Applicant Portal:** Resume upload (PDF/Text), auto-parsing, match score, missing skills & actionable career recommendations.
  * **Recruiter Screening:** Target role selection, threshold cutoff filtering, batch candidate ranking & yield analysis.

---

## 🔒 Security & Environment Configuration

Production Secrets are configured securely through Hugging Face Space Settings:
```env
GEMINI_API_KEY=your_gemini_api_key_here
GEMINI_MODEL=gemini-2.5-flash
```

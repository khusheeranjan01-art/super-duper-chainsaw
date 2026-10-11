# 🎯 AI-Powered Resume & Internship Matching Platform

[![CI/CD Pipeline](https://github.com/khusheeranjan01-art/super-duper-chainsaw/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/khusheeranjan01-art/super-duper-chainsaw/actions/workflows/ci-cd.yml)
![Python 3.11](https://img.shields.io/badge/Python-3.11-blue.svg)
![FastAPI](https://img.shields.io/badge/FastAPI-0.100+-green.svg)
![PyTorch](https://img.shields.io/badge/PyTorch-2.0+-orange.svg)
![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)

An intelligent, multi-tier recruitment and internship matching engine combining **Deep Learning (PyTorch)**, **Dense Vector Retrieval (FAISS)**, **Sentence-Transformers**, and **Google Gemini LLM** for deep applicant analysis, skill-gap recommendations, and candidate screening.

---

## 🏛️ System Architecture & Cloud Deployment Strategy

This system follows a **Decoupled Microservices / Multi-Tier Architecture** for scalability, high availability, and isolated resource utilization:

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
│  2. Containerized Backend (Docker / Cloud)   │
│     - FastAPI Asynchronous Gateway           │
│     - Custom PyTorch Dual-Encoder Matcher    │
│     - FAISS Vector Similarity Index          │
│     - Isolated container with 16GB RAM tier  │
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

## 🔄 CI/CD Pipeline (GitHub Actions)

The repository integrates an automated **Continuous Integration & Continuous Delivery (CI/CD)** pipeline (`.github/workflows/ci-cd.yml`):
* **Automated Linting & Syntax Validation:** Flake8 static analysis.
* **Dependency Health Checks:** Verification of core PyTorch, FAISS, and FastAPI runtimes.
* **Container Build Testing:** Automated validation of Docker container builds on push to `main`.

---

## 🔒 Security & Environment Configuration

* **Zero-Leakage Policy:** API keys and credentials are never checked into version control.
* **Production Secrets:** Configured securely through Cloud Environment Variables:
  ```env
  GEMINI_API_KEY=your_gemini_api_key_here
  GEMINI_MODEL=gemini-2.5-flash
  PORT=7860
  ```

---

## 🐳 Local Docker Execution

To build and run the containerized application locally:

```bash
# 1. Build the Docker container
docker build -t resume-matcher .

# 2. Run the container
docker run -p 7860:7860 --env-file backend/.env resume-matcher
```

Access the application in your browser at `http://localhost:7860`.

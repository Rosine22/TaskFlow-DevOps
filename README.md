# 📝 TaskFlow – Your Simple Cloud To-Do List

**TaskFlow** is a minimalist web-based to-do list application built with a modern full-stack architecture. The goal is to help users track daily tasks with a clean UI, persistent cloud storage, and DevOps best practices.

This README documents the initial project setup including repository structure, branching strategy, CI pipeline setup, and local development preparation.

---

## 📦 Current Project Status

> This project is in the **setup phase**. The following have been configured:

- ✅ Git repository initialized with `main` and `develop` branches
- ✅ `.gitignore` files for backend and frontend
- ✅ Basic folder scaffolding for backend (Node.js + Express) and frontend (React + TypeScript)
- ✅ Environment variable structure using `.env`
- ✅ GitHub Actions CI pipeline for linting and testing
- ✅ Branch protection rules for `main`
- ✅ Pull request template for structured collaboration

---

## 🧱 Tech Stack (So Far)

| Layer     | Tech                  |
|-----------|------------------------|
| Frontend  | React + TypeScript (Vite) |
| Backend   | Node.js + Express      |
| Database  | MongoDb                |
| CI/CD     | GitHub Actions         | |

---

## 📂 Project Structure

Taskflow/
│
├── backend/ # Express.js API (WIP)
│
├── frontend/ # React + TypeScript (Vite)
│
├── .github/ # GitHub Actions + PR templates
│ └── workflows/
│
├── .gitignore # Covers node_modules, .env, dist, etc.
├── README.md
└── .env.example

## Local Setup Instructions

> Have `Node.js` and `npm` installed.

### 1. Clone the Repository
```bash
git clone https://github.com/Rosine22/TaskFlow-DevOps
cd TaskFlow-DevOps

### 2. Install Frontend
```bash
cd frontend
npm install
npm run dev
### 3. Install Backend
``bash
cd ../backend
npm install
# TaskFlow-DevOps

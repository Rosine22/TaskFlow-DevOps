# TaskFlow-DevOps# 📝 TaskFlow – Your Simple Cloud To-Do List

**TaskFlow** is a minimalist web-based to-do list application built with a modern full-stack architecture. The goal is to help users track daily tasks with a clean UI, persistent cloud storage, and DevOps best practices.

This README documents the full project setup including folder structure, local development, Docker, infrastructure as code (IaC) using Terraform, and manual cloud deployment.

---

## 📦 Current Project Status

> The project is in its **final phase**. The following have been completed:

- ✅ Frontend built using React + TypeScript + Vite
- ✅ Backend built with Express.js and MongoDB
- ✅ JWT-based user authentication
- ✅ Dockerized backend and frontend with multi-stage builds
- ✅ `docker-compose.yml` for local container orchestration
- ✅ Infrastructure as Code (Terraform) for Azure setup
- ✅ Manual cloud deployment tested and successful
- ✅ GitHub repo with project board and PR review

---

## 🧱 Tech Stack (Final)

| Layer     | Tech                           |
|-----------|---------------------------------|
| Frontend  | React + TypeScript (Vite)       |
| Backend   | Node.js + Express               |
| Database  | MongoDB (Atlas or Docker)       |
| Auth      | JWT                             |
| CI/CD     | GitHub Actions (manual tested)  |
| IaC       | Terraform (Azure deployment)    |
| DevOps    | Docker + Docker Compose         |

---

## 📂 Project Structure
TaskFlow/
│
├── backend/ # Express.js API
│ ├── controllers/
│ ├── models/
│ ├── routes/
│ ├── config/
│ ├── server.js
│ ├── Dockerfile
│ └── .env
│
├── frontend/ # React + TypeScript app
│ ├── src/
│ ├── public/
│ ├── vite.config.ts
│ ├── Dockerfile
│ └── .env
│
├── terraform/ # Terraform scripts for Azure
│
├── docker-compose.yml # Dev setup
├── README.md
└── .gitignore


---

## 💻 Local Development Setup

> Ensure you have **Node.js**, **npm**, and **Docker** installed.

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Rosine22/TaskFlow-DevOps.git
cd TaskFlow-DevOps

### 2️⃣ Run With Docker
docker-compose up --build
Frontend: http://localhost:3000

Backend: http://localhost:5000

MongoDB: containerized

⚙️ Environment Variables
Backend (backend/.env)
env
Copy
Edit
MONGO_URI=mongodb://mongo:27017/taskflow
JWT_SECRET=your_jwt_secret_key
PORT=5000
Frontend (frontend/.env)
env
Copy
Edit
VITE_API_URL=http://localhost:5000
☁️ Cloud Deployment (Manual with Terraform)
You must have an Azure account and az login set up.

1. Terraform Setup
bash
Copy
Edit
cd terraform
terraform init
terraform plan
terraform apply
This provisions:

Azure Container Registry

Azure MongoDB (or connects to MongoDB Atlas)

Azure Container Apps (for frontend + backend)

2. Docker Build and Push
bash
Copy
Edit
az acr login --name <your-acr-name>

# Tag and push images
docker tag taskflow-frontend <acr-url>/taskflow-frontend
docker tag taskflow-backend <acr-url>/taskflow-backend

docker push <acr-url>/taskflow-frontend
docker push <acr-url>/taskflow-backend
3. Access
Once deployed, you’ll receive a public URL for the frontend from Azure. You can now test your full app in the cloud.

🧪 Testing the App
✅ Register/Login with valid credentials

✅ Create, update, delete tasks

✅ Tasks persist in database

✅ JWT token securely used across requests

✅ Cloud app behaves like local version

Video Demo: https://www.youtube.com/watch?v=ovVLJ6KF0aM

# SPE Major Project – Real‑Time Chat Application

## 📌 Project Overview

This project is a **full‑stack real‑time chat application** developed as part of the **SPE Major Project**. It demonstrates how to design, build, and deploy a scalable messaging system using modern web technologies and DevOps practices.

The application allows multiple users to communicate in **real time** using WebSockets, while messages and user data are persisted in a database. The project also focuses heavily on **deployment automation**, making it suitable for real‑world production scenarios.

---

## ✨ Key Features

- 🔐 User authentication and session management
- 💬 Real‑time one‑to‑one / group chat using WebSockets
- 🗂 Persistent message storage in MongoDB
- ⚡ Fast and responsive frontend using React
- 🔄 Centralized state management with Redux Toolkit
- 🐳 Docker & Docker‑Compose support
- ☸️ Kubernetes deployment configuration
- 🤖 CI/CD automation using Jenkins
- 📦 Infrastructure automation with Ansible

---

## 🏗️ System Architecture

```
Browser (React)
     │
     │ HTTP / WebSocket
     ▼
Node.js + Express + Socket.io
     │
     │ Database Queries
     ▼
MongoDB
```

- **Frontend** handles UI and user interactions
- **Backend** manages APIs, authentication, and real‑time events
- **Socket.io** enables bidirectional real‑time communication
- **MongoDB** stores users, chats, and messages

---

## 🧰 Tech Stack

### Frontend
- React
- Redux Toolkit
- JavaScript (ES6+)
- HTML & CSS

### Backend
- Node.js
- Express.js
- Socket.io

### Database
- MongoDB

### DevOps & Deployment
- Docker
- Docker Compose
- Kubernetes
- Jenkins
- Ansible

---

## 📂 Project Structure

```
spe-major/
│
├── client/                 # Frontend (React)
│   ├── src/
│   ├── public/
│   └── package.json
│
├── server/                 # Backend (Node.js + Express)
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   ├── socket/
│   └── package.json
│
├── docker-compose.yml      # Multi-container setup
├── Jenkinsfile             # CI/CD pipeline
├── k8/                     # Kubernetes manifests
├── inventory/              # Ansible inventory
├── playbook.yml            # Ansible playbook
├── setup.sh                # Setup script
└── README.md
```

---

## ⚙️ Prerequisites

Make sure the following are installed:

- Node.js (v16 or later recommended)
- npm or yarn
- MongoDB (local or Atlas)
- Docker & Docker Compose
- (Optional) Kubernetes cluster (Minikube / EKS / AKS)

---

## 🚀 Running the Project Locally (Without Docker)

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/akhilballa/spe-major.git
cd spe-major
```

---

### 2️⃣ Backend Setup

```bash
cd server
npm install
```

Create a `.env` file inside `server/`:

```env
PORT=5000
MONGO_URI=mongodb://localhost:27017/chatapp
JWT_SECRET=your_secret_key
```

Start the backend server:

```bash
npm start
```

Server will run on:

```
http://localhost:5000
```

---

### 3️⃣ Frontend Setup

Open a new terminal:

```bash
cd client
npm install
npm start
```

Frontend will run on:

```
http://localhost:3000
```

---

## 🐳 Running with Docker Compose (Recommended)

This is the **easiest way** to run the entire stack.

### 1️⃣ Start Containers

From the root directory:

```bash
docker-compose up --build
```

### 2️⃣ Stop Containers

```bash
docker-compose down
```

Services started:
- Frontend
- Backend
- MongoDB

---

## ☸️ Kubernetes Deployment (Optional)

### 1️⃣ Apply Kubernetes Configurations

```bash
kubectl apply -f k8/
```

### 2️⃣ Check Pods & Services

```bash
kubectl get pods
kubectl get services
```

---

## 🤖 CI/CD Pipeline (Jenkins)

- The `Jenkinsfile` defines:
  - Code checkout
  - Dependency installation
  - Build process
  - Docker image creation
  - Deployment steps

Trigger pipeline manually or via GitHub webhook.

---

## 📦 Ansible Automation

To provision servers or configure deployments:

```bash
ansible-playbook -i inventory playbook.yml
```

---

## 🔐 Environment Variables Summary

| Variable | Description |
|--------|------------|
| PORT | Backend server port |
| MONGO_URI | MongoDB connection string |
| JWT_SECRET | Authentication secret key |

---

## 🧪 Common Commands Cheat Sheet

```bash
# Install dependencies
npm install

# Start backend
npm start

# Start frontend
npm start

# Docker compose
Docker-compose up --build

# Kubernetes deploy
kubectl apply -f k8/
```

---

## 📈 Future Enhancements

- Typing indicators
- Message read receipts
- File & image sharing
- Push notifications
- End‑to‑end encryption

---

## 👨‍💻 Author

**Akhil Balla**  
SPE Major Project

---

## 📄 License

This project is for **academic and learning purposes**.

---

✅ *This README is intentionally detailed so it can be directly used in evaluations, viva, or project submissions.*


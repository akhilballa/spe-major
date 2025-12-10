pipeline {
    agent any
    environment {
       FRONTEND_URL='http://localhost:3000'
       MONGODB_URI='mongodb://localhost:27017/'
       JWT_SECRET_KEY='jhdcjhsdvchjsdhbfasdgbvs'        // change 
       REACT_APP_CLOUDINARY_CLOUD_NAME = 'dc5tnb82m'
       REACT_APP_BACKEND_URL = 'http://localhost:8080'
       PORT='8080'
       KUBECONFIG = '/var/lib/jenkins/.kube/config'
       DOCKER_REPO = 'akhilballa112'
       REPO_NAME = 'chat-app'

    }
    stages {
        stage('Clone Git') {
            steps {
                git branch: 'main', url: 'https://github.com/akhilballa/spe-major.git'
            }
        }
        stage('Build Frontend Image') {
            steps {
                dir('client'){
                sh "npm install"
                sh 'docker build -t frontend-image .'
            }
            }
        }
        stage('Build Backend Image') {
            steps {
                dir('server'){
                sh "npm install"
                sh 'docker build -t backend-image .'
            }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                        sh "docker login --username akhilballa112 --password akhil123*"
                        sh 'docker tag frontend-image akhilballa112/chat-app:frontend'
                        sh 'docker push akhilballa112/chat-app:frontend'
                        sh "docker tag backend-image akhilballa112/chat-app:backend"
                        sh "docker push akhilballa112/chat-app:backend"
                    
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    sh 'ansible-galaxy collection install kubernetes.core'
                }
            }
        }
        stage('Kubernetes') {
            steps {
                script {
                    sh 'ansible-playbook -i inventory-k8 playbook-k8.yml'
                }
            }
        }
    }
}
// pipeline {
//     agent any
//     environment {
//        FRONTEND_URL='http://localhost:3000'
//        MONGODB_URI='mongodb://localhost:27017/'
//        JWT_SECRET_KEY='jhdcjhsdvchjsdhbfasdgbvs'        // change 
//        REACT_APP_CLOUDINARY_CLOUD_NAME = 'dc5tnb82m'
//        REACT_APP_BACKEND_URL = 'http://localhost:8080'
//        PORT='8080'
//        KUBECONFIG = '/var/lib/jenkins/.kube/config'
//        DOCKER_REPO = 'akhilballa112'
//        REPO_NAME = 'chat-app'

//     }
//     stages {
//         stage('Clone Git') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/akhilballa/spe-major.git'
//             }
//         }
//         stage('Build Frontend Image') {
//             steps {
//                 dir('client'){
//                 sh "npm install"
//                 sh 'docker build -t frontend-image .'
//             }
//             }
//         }
//         stage('Build Backend Image') {
//             steps {
//                 dir('server'){
//                 sh "npm install"
//                 sh 'docker build -t backend-image .'
//             }
//             }
//         }
//         stage('Push to Docker Hub') {
//             steps {
//                 script {
//                         sh "docker login --username akhilballa112 --password akhil123*"
//                         sh 'docker tag frontend-image akhilballa112/chat-app:frontend'
//                         sh 'docker push akhilballa112/chat-app:frontend'
//                         sh "docker tag backend-image akhilballa112/chat-app:backend"
//                         sh "docker push akhilballa112/chat-app:backend"
                    
//                 }
//             }
//         }
//         stage('Install Dependencies') {
//             steps {
//                 script {
//                     sh 'ansible-galaxy collection install kubernetes.core'
//                 }
//             }
//         }
//         stage('Kubernetes') {
//             steps {
//                 script {
//                     sh 'ansible-playbook -i inventory-k8 playbook-k8.yml'
//                 }
//             }
//         }
//     }
// }


// pipeline {
//   agent any

//   environment {
//     FRONTEND_URL = 'http://localhost:3000'
//     MONGODB_URI  = 'mongodb://localhost:27017/'
//     REACT_APP_CLOUDINARY_CLOUD_NAME = 'dc5tnb82m'
//     REACT_APP_BACKEND_URL = 'http://localhost:8080'
//     PORT = '8080'

//     // Docker
//     DOCKER_REPO = 'akhilballa112'
//     REPO_NAME = 'chat-app'
//   }

//   stages {

//     stage('Init / Checkout') {
//       steps {
//         // The pipeline SCM checkout (Jenkins already performed at start)
//         echo "Using existing workspace checkout (Jenkins' SCM)"
//         // if you want explicit re-checkout, uncomment:
//         // checkout scm
//       }
//     }

//     stage('Build Frontend Image') {
//       steps {
//         dir('client') {
//           script {
//             env.FRONTEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:frontend-${env.BUILD_NUMBER}"
//             sh "docker build -t ${env.FRONTEND_IMAGE} ."
//           }
//         }
//       }
//     }

//     stage('Build Backend Image') {
//       steps {
//         dir('server') {
//           script {
//             env.BACKEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:backend-${env.BUILD_NUMBER}"
//             sh "docker build -t ${env.BACKEND_IMAGE} ."
//           }
//         }
//       }
//     }

//     stage('Push to Docker Hub') {
//       steps {
//         withCredentials([
//           usernamePassword(
//             credentialsId: 'docker-hub-creds',
//             usernameVariable: 'DOCKER_USER',
//             passwordVariable: 'DOCKER_PASS'
//           )
//         ]) {
//           sh 'echo "$DOCKER_PASS" | docker login --username "$DOCKER_USER" --password-stdin'
//           sh "docker push ${env.FRONTEND_IMAGE}"
//           sh "docker push ${env.BACKEND_IMAGE}"
//           sh 'docker logout'
//         }
//       }
//     }

//     stage('Install Ansible Dependencies') {
//       steps {
//         sh 'ansible-galaxy collection install kubernetes.core'
//       }
//     }

//     // stage('Kubernetes Deploy') {
//     //   steps {
//     //     withCredentials([file(credentialsId: 'kubeconfig-file', variable: 'KUBECONFIG_FILE')]) {
//     //       sh '''
//     //         mkdir -p $HOME/.kube
//     //         cp "$KUBECONFIG_FILE" "$HOME/.kube/config"
//     //         export KUBECONFIG="$HOME/.kube/config"
//     //       '''
//     //       sh "ansible-playbook -i inventory-k8 playbook-k8.yml --extra-vars \"frontend_image=${env.FRONTEND_IMAGE} backend_image=${env.BACKEND_IMAGE}\""
//     //     }
//     //   }
//     // }
//   }

//   post {
//     always {
//       echo "Build #${env.BUILD_NUMBER} Completed"
//       echo "Frontend Image: ${env.FRONTEND_IMAGE}"
//       echo "Backend Image:  ${env.BACKEND_IMAGE}"
//     }
//     failure {
//       echo "Build Failed ❌"
//     }
//   }
// }



pipeline {
  agent any
  stages {
    stage('Check Docker') {
      steps {
        sh '''
          echo "User: $(whoami)"
          echo "PATH=$PATH"
          which docker || true
          docker --version || true
          docker ps || true
        '''
      }
    }
  }
}

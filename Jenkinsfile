// // environment {
// //   DOCKER_BIN = '/usr/local/bin/docker'
// //   DOCKER_REPO = 'akhilballa112'
// //   REPO_NAME = 'chat-app'
// // }


// // pipeline {
// //     agent any
// //     environment {
// //        FRONTEND_URL='http://localhost:3000'
// //        MONGODB_URI='mongodb://localhost:27017/'
// //        JWT_SECRET_KEY='jhdcjhsdvchjsdhbfasdgbvs'        // change 
// //        REACT_APP_CLOUDINARY_CLOUD_NAME = 'dc5tnb82m'
// //        REACT_APP_BACKEND_URL = 'http://localhost:8080'
// //        PORT='8080'
// //        KUBECONFIG = '/var/lib/jenkins/.kube/config'
// //        DOCKER_REPO = 'akhilballa112'
// //        REPO_NAME = 'chat-app'

// //     }
// //     stages {
// //         stage('Clone Git') {
// //             steps {
// //                 git branch: 'main', url: 'https://github.com/akhilballa/spe-major.git'
// //             }
// //         }
// //         stage('Build Frontend Image') {
// //             steps {
// //                 dir('client'){
// //                 sh "npm install"
// //                 sh 'docker build -t frontend-image .'
// //             }
// //             }
// //         }
// //         stage('Build Backend Image') {
// //             steps {
// //                 dir('server'){
// //                 sh "npm install"
// //                 sh 'docker build -t backend-image .'
// //             }
// //             }
// //         }
// //         stage('Push to Docker Hub') {
// //             steps {
// //                 script {
// //                         sh "docker login --username akhilballa112 --password akhil123*"
// //                         sh 'docker tag frontend-image akhilballa112/chat-app:frontend'
// //                         sh 'docker push akhilballa112/chat-app:frontend'
// //                         sh "docker tag backend-image akhilballa112/chat-app:backend"
// //                         sh "docker push akhilballa112/chat-app:backend"
                    
// //                 }
// //             }
// //         }
// //         stage('Install Dependencies') {
// //             steps {
// //                 script {
// //                     sh 'ansible-galaxy collection install kubernetes.core'
// //                 }
// //             }
// //         }
// //         stage('Kubernetes') {
// //             steps {
// //                 script {
// //                     sh 'ansible-playbook -i inventory-k8 playbook-k8.yml'
// //                 }
// //             }
// //         }
// //     }
// // }


// // pipeline {
// //   agent any

// //   environment {
// //     FRONTEND_URL = 'http://localhost:3000'
// //     MONGODB_URI  = 'mongodb://localhost:27017/'
// //     REACT_APP_CLOUDINARY_CLOUD_NAME = 'dc5tnb82m'
// //     REACT_APP_BACKEND_URL = 'http://localhost:8080'
// //     PORT = '8080'

// //     // Docker
// //     DOCKER_REPO = 'akhilballa112'
// //     REPO_NAME = 'chat-app'
// //   }

// //   stages {

// //     stage('Init / Checkout') {
// //       steps {
// //         // The pipeline SCM checkout (Jenkins already performed at start)
// //         echo "Using existing workspace checkout (Jenkins' SCM)"
// //         // if you want explicit re-checkout, uncomment:
// //         // checkout scm
// //       }
// //     }

// //     stage('Build Frontend Image') {
// //       steps {
// //         dir('client') {
// //           script {
// //             env.FRONTEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:frontend-${env.BUILD_NUMBER}"
// //             sh "docker build -t ${env.FRONTEND_IMAGE} ."
// //           }
// //         }
// //       }
// //     }

// //     stage('Build Backend Image') {
// //       steps {
// //         dir('server') {
// //           script {
// //             env.BACKEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:backend-${env.BUILD_NUMBER}"
// //             sh "docker build -t ${env.BACKEND_IMAGE} ."
// //           }
// //         }
// //       }
// //     }

// //     stage('Push to Docker Hub') {
// //       steps {
// //         withCredentials([
// //           usernamePassword(
// //             credentialsId: 'docker-hub-creds',
// //             usernameVariable: 'DOCKER_USER',
// //             passwordVariable: 'DOCKER_PASS'
// //           )
// //         ]) {
// //           sh 'echo "$DOCKER_PASS" | docker login --username "$DOCKER_USER" --password-stdin'
// //           sh "docker push ${env.FRONTEND_IMAGE}"
// //           sh "docker push ${env.BACKEND_IMAGE}"
// //           sh 'docker logout'
// //         }
// //       }
// //     }

// //     stage('Install Ansible Dependencies') {
// //       steps {
// //         sh 'ansible-galaxy collection install kubernetes.core'
// //       }
// //     }

// //     // stage('Kubernetes Deploy') {
// //     //   steps {
// //     //     withCredentials([file(credentialsId: 'kubeconfig-file', variable: 'KUBECONFIG_FILE')]) {
// //     //       sh '''
// //     //         mkdir -p $HOME/.kube
// //     //         cp "$KUBECONFIG_FILE" "$HOME/.kube/config"
// //     //         export KUBECONFIG="$HOME/.kube/config"
// //     //       '''
// //     //       sh "ansible-playbook -i inventory-k8 playbook-k8.yml --extra-vars \"frontend_image=${env.FRONTEND_IMAGE} backend_image=${env.BACKEND_IMAGE}\""
// //     //     }
// //     //   }
// //     // }
// //   }

// //   post {
// //     always {
// //       echo "Build #${env.BUILD_NUMBER} Completed"
// //       echo "Frontend Image: ${env.FRONTEND_IMAGE}"
// //       echo "Backend Image:  ${env.BACKEND_IMAGE}"
// //     }
// //     failure {
// //       echo "Build Failed ❌"
// //     }
// //   }
// // }


// pipeline {
//   agent any

//   environment {
//     // set this to '/usr/local/bin/docker' if Jenkins still can't find docker in PATH
//     DOCKER_BIN = '/usr/local/bin/docker'
//     DOCKER_REPO = 'akhilballa112'
//     REPO_NAME   = 'chat-app'

//     FRONTEND_URL = 'http://localhost:3000'
//     REACT_APP_CLOUDINARY_CLOUD_NAME = 'dc5tnb82m'
//     REACT_APP_BACKEND_URL = 'http://localhost:8080'
//     MONGODB_URI = 'mongodb://host.docker.internal:27017/'
//     PORT = '8080'
//   }

//   stages {

//     stage('Checkout') {
//       steps {
//         checkout scm
//         echo "Checked out ${env.GIT_COMMIT ?: 'workspace'}"
//       }
//     }
//     // stage('Docker Login') {
//     //   steps {
//     //     withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
//     //     sh 'echo "$DOCKER_PASS" | ${DOCKER_BIN} login --username "$DOCKER_USER" --password-stdin'
//     //     }
//     //   }
//     // } 
//     // stage('Docker Login') {
//     //   steps {
//     //     withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
//     //                                       usernameVariable: 'DOCKER_USER',
//     //                                       passwordVariable: 'DOCKER_PASS')]) {
//     //       script {
//     //         sh """
//     //           DCFG="${WORKSPACE}/.docker-temp"
//     //           rm -rf "$DCFG"
//     //           mkdir -p "$DCFG"
//     //           echo '{}' > "$DCFG/config.json"
//     //           # login using temp config so docker won't try to exec host credential helpers
//     //           printf "%s" "$DOCKER_PASS" | ${DOCKER_BIN} --config "$DCFG" login --username "$DOCKER_USER" --password-stdin
//     //         """
//     //         env.DOCKER_BUILD_CONFIG = "${WORKSPACE}/.docker-temp"
//     //       }
//     //     }
//     //   }
//     // }
//     stage('Docker Login') {
//   steps {
//     withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
//                                       usernameVariable: 'DOCKER_USER',
//                                       passwordVariable: 'DOCKER_PASS')]) {
//       script {
//         // define the config path in Groovy and export it for later stages
//         env.DOCKER_BUILD_CONFIG = "${env.WORKSPACE}/.docker-temp"

//         // create temp config and login using that config (so docker won't call desktop helper)
//         sh """
//           rm -rf "${env.DOCKER_BUILD_CONFIG}"
//           mkdir -p "${env.DOCKER_BUILD_CONFIG}"
//           echo '{}' > "${env.DOCKER_BUILD_CONFIG}/config.json"
//           printf "%s" "$DOCKER_PASS" | ${DOCKER_BIN} --config "${env.DOCKER_BUILD_CONFIG}" login --username "$DOCKER_USER" --password-stdin
//           ls -la "${env.DOCKER_BUILD_CONFIG}"
//         """
//       } // end script
//     } // end withCredentials
//   } // end steps
// } // end stage




//     stage('Build Frontend Image') {
//       steps {
//         dir('client') {
//           script {
//             // image tag includes build number
//             env.FRONTEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:frontend-${env.BUILD_NUMBER}"
//             // build using Dockerfile in client/ (Dockerfile must run npm ci and build)
//             sh "${DOCKER_BIN} build -t ${env.FRONTEND_IMAGE} ."
//           }
//         }
//       }
//     }

//     stage('Build Backend Image') {
//       steps {
//         dir('server') {
//           script {
//             env.BACKEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:backend-${env.BUILD_NUMBER}"
//             // server Dockerfile must run npm ci (no npm on agent required)
//             sh "${DOCKER_BIN} build -t ${env.BACKEND_IMAGE} ."
//           }
//         }
//       }
//     }

//     stage('Push Images to Docker Hub') {
//       steps {
//         // create a Jenkins credential of kind "Username with password" or token and set id docker-hub-creds
//         withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
//           // sh 'echo "$DOCKER_PASS" | ${DOCKER_BIN} login --username "$DOCKER_USER" --password-stdin'
//           sh 'echo "$DOCKER_PASS" | ${DOCKER_BIN} --config ${env.DOCKER_BUILD_CONFIG} login --username "$DOCKER_USER" --password-stdin'
//           sh "${DOCKER_BIN} push ${env.FRONTEND_IMAGE}"
//           sh "${DOCKER_BIN} push ${env.BACKEND_IMAGE}"
//           sh "${DOCKER_BIN} logout || true"
//         }
//       }
//     }

//     stage('Install Ansible deps') {
//       steps {
//         // allow continue if ansible-galaxy already installed or fails
//         sh 'ansible-galaxy collection install kubernetes.core || true'
//       }
//     }

//     // stage('Kubernetes Deploy (optional)') {
//     //   when {
//     //     expression { return fileExists('playbook-k8.yml') }
//     //   }
//     //   steps {
//     //     // optional: provide kubeconfig-file credential in Jenkins (Secret file)
//     //     withCredentials([file(credentialsId: 'kubeconfig-file', variable: 'KUBECONFIG_FILE')]) {
//     //       sh '''
//     //         mkdir -p $HOME/.kube
//     //         cp "$KUBECONFIG_FILE" "$HOME/.kube/config"
//     //         export KUBECONFIG="$HOME/.kube/config"
//     //         ansible-playbook -i inventory-k8 playbook-k8.yml --extra-vars "frontend_image=${FRONTEND_IMAGE} backend_image=${BACKEND_IMAGE}"
//     //       '''
//     //     }
//     //   }
//     // }
//   }

//   post {
//     always {
//       echo "Build #${env.BUILD_NUMBER} Completed"
//       echo "Frontend Image: ${env.FRONTEND_IMAGE}"
//       echo "Backend Image: ${env.BACKEND_IMAGE}"
//     }
//     failure {
//       echo "Build Failed ❌"
//     }
//   }
// }



// // pipeline {
// //   agent any
// //   stages {
// //     stage('Check Docker') {
// //       steps {
// //         sh '''
// //           echo "User: $(whoami)"
// //           echo "PATH=$PATH"
// //           which docker || true
// //           docker --version || true
// //           docker ps || true
// //         '''
// //       }
// //     }
// //   }
// // }




// RUNNING VERSION     ****

// pipeline {
//   agent any

//   environment {
//     // Docker binary (use absolute path so Jenkins finds it even if PATH is weird)
//     DOCKER_BIN = '/usr/local/bin/docker'

//     // Docker repo info
//     DOCKER_REPO = 'akhilballa112'
//     REPO_NAME   = 'chat-app'

//     // App envs (only illustrative; do NOT store secrets here)
//     FRONTEND_URL = 'http://localhost:3000'
//     REACT_APP_CLOUDINARY_CLOUD_NAME = 'dc5tnb82m'
//     REACT_APP_BACKEND_URL = 'http://localhost:8080'
//     MONGODB_URI = 'mongodb://host.docker.internal:27017/'
//     PORT = '8080'
//   }

//   stages {

//     stage('Checkout') {
//       steps {
//         checkout scm
//         echo "Checked out commit: ${env.GIT_COMMIT ?: 'unknown'}"
//       }
//     }

//     stage('Prepare Docker config & Login') {
//       steps {
//         // create a temp docker config in workspace and login using Jenkins credentials
//         withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
//                                           usernameVariable: 'DOCKER_USER',
//                                           passwordVariable: 'DOCKER_PASS')]) {
//           script {
//             // set a workspace-local docker config path for subsequent docker calls
//             env.DOCKER_BUILD_CONFIG = "${env.WORKSPACE}/.docker-temp"
//           }

//           // Use shell block without Groovy interpolation for secrets
//           sh '''
//             # remove any old temp config, create fresh one
//             rm -rf "${DOCKER_BUILD_CONFIG}"
//             mkdir -p "${DOCKER_BUILD_CONFIG}"

//             # minimal config.json so docker CLI won't attempt to call host credential helpers
//             cat > "${DOCKER_BUILD_CONFIG}/config.json" <<'JSON'
// {
//   "auths": {
//     "https://index.docker.io/v1/": {}
//   },
//   "credsStore": ""
// }
// JSON

//             echo "Logging into Docker Hub (using temp config)..."
//             # login using stdin so password isn't leaked in args
//             printf "%s" "$DOCKER_PASS" | "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" login --username "$DOCKER_USER" --password-stdin
//             echo "Docker login succeeded and temp config written to: ${DOCKER_BUILD_CONFIG}"
//             ls -la "${DOCKER_BUILD_CONFIG}"
//           '''
//         }
//       }
//     }

//     stage('Build Frontend Image') {
//       steps {
//         dir('client') {
//           script {
//             env.FRONTEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:frontend-${env.BUILD_NUMBER}"
//           }
//           // build using the temp config so host credential helpers are not invoked
//           sh '''
//             echo "Building frontend image: ${FRONTEND_IMAGE}"
//             "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" build -t "${FRONTEND_IMAGE}" .
//           '''
//         }
//       }
//     }

//     stage('Build Backend Image') {
//       steps {
//         dir('server') {
//           script {
//             env.BACKEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:backend-${env.BUILD_NUMBER}"
//           }
//           sh '''
//             echo "Building backend image: ${BACKEND_IMAGE}"
//             "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" build -t "${BACKEND_IMAGE}" .
//           '''
//         }
//       }
//     }

//     stage('Push Images to Docker Hub') {
//       steps {
//         // use same credentials again just to be safe (secure binding)
//         withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
//                                           usernameVariable: 'DOCKER_USER',
//                                           passwordVariable: 'DOCKER_PASS')]) {
//           sh '''
//             echo "Ensuring login before push..."
//             printf "%s" "$DOCKER_PASS" | "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" login --username "$DOCKER_USER" --password-stdin

//             echo "Pushing ${FRONTEND_IMAGE}..."
//             "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${FRONTEND_IMAGE}"

//             echo "Pushing ${BACKEND_IMAGE}..."
//             "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${BACKEND_IMAGE}"

//             # logout best-effort
//             "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" logout || true
//           '''
//         }
//       }
//     }

//     stage('Install Ansible deps (optional)') {
//       steps {
//         // won't fail the build if collection already present or ansible not installed
//         sh 'ansible-galaxy collection install kubernetes.core || true'
//       }
//     }

//     stage('Cleanup workspace docker config') {
//       steps {
//         sh '''
//           # remove temp docker config to avoid leaving secrets in workspace
//           rm -rf "${DOCKER_BUILD_CONFIG}" || true
//           echo "Cleaned up Docker temp config."
//         '''
//       }
//     }
//   }

//   post {
//     always {
//       echo "Build #${env.BUILD_NUMBER} finished."
//       echo "Frontend image: ${env.FRONTEND_IMAGE ?: 'N/A'}"
//       echo "Backend image : ${env.BACKEND_IMAGE ?: 'N/A'}"
//     }
//     failure {
//       echo "Pipeline failed. Check logs above for the first failing error."
//     }
//   }
// }



pipeline {
  agent any

  environment {
    DOCKER_BIN = '/usr/local/bin/docker'
    DOCKER_REPO = 'akhilballa112'
    REPO_NAME   = 'chat-app'

    // Path where temporary Docker credentials are stored
    DOCKER_BUILD_CONFIG = "${env.WORKSPACE}/.docker-temp"
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        echo "Checked out commit: ${env.GIT_COMMIT ?: 'unknown'}"
      }
    }

    stage('Prepare Docker Login') {
      steps {
        withCredentials([usernamePassword(
            credentialsId: 'docker-hub-creds',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {

          sh '''
            rm -rf "${DOCKER_BUILD_CONFIG}"
            mkdir -p "${DOCKER_BUILD_CONFIG}"

            cat > "${DOCKER_BUILD_CONFIG}/config.json" <<'JSON'
{
  "auths": {
    "https://index.docker.io/v1/": {}
  },
  "credsStore": ""
}
JSON

            echo "Logging in..."
            printf "%s" "$DOCKER_PASS" | "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" login --username "$DOCKER_USER" --password-stdin
          '''
        }
      }
    }

    stage('Build Frontend Image') {
      steps {
        dir('client') {
          script {
            env.FRONTEND_VERSIONED = "${DOCKER_REPO}/${REPO_NAME}:frontend-${env.BUILD_NUMBER}"
            env.FRONTEND_LATEST    = "${DOCKER_REPO}/${REPO_NAME}:frontend-latest"
          }

          sh '''
            echo "Building FE image: ${FRONTEND_VERSIONED}"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" build -t "${FRONTEND_VERSIONED}" .

            echo "Tagging FE image as latest"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" tag "${FRONTEND_VERSIONED}" "${FRONTEND_LATEST}"
          '''
        }
      }
    }

    stage('Build Backend Image') {
      steps {
        dir('server') {
          script {
            env.BACKEND_VERSIONED = "${DOCKER_REPO}/${REPO_NAME}:backend-${env.BUILD_NUMBER}"
            env.BACKEND_LATEST    = "${DOCKER_REPO}/${REPO_NAME}:backend-latest"
          }

          sh '''
            echo "Building BE image: ${BACKEND_VERSIONED}"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" build -t "${BACKEND_VERSIONED}" .

            echo "Tagging BE image as latest"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" tag "${BACKEND_VERSIONED}" "${BACKEND_LATEST}"
          '''
        }
      }
    }

    stage('Push Images') {
      steps {
        withCredentials([usernamePassword(
            credentialsId: 'docker-hub-creds',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {

          sh '''
            printf "%s" "$DOCKER_PASS" | "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" login --username "$DOCKER_USER" --password-stdin

            echo "Pushing frontend images..."
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${FRONTEND_VERSIONED}"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${FRONTEND_LATEST}"

            echo "Pushing backend images..."
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${BACKEND_VERSIONED}"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${BACKEND_LATEST}"

            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" logout || true
          '''
        }
      }
    }

    stage('Deploy to Kubernetes') {
      when {
        expression { fileExists("k8s") }
      }
      steps {
        sh '''
          echo "Applying Kubernetes manifests..."
          kubectl apply -f k8s/
        '''
      }
    }

    stage('Clean Docker Temp') {
      steps {
        sh '''
          rm -rf "${DOCKER_BUILD_CONFIG}"
          echo "Cleaned Docker temp."
        '''
      }
    }
  }

  post {
    always {
      echo "Build #${env.BUILD_NUMBER} completed."
      echo "FE Image (versioned): ${env.FRONTEND_VERSIONED}"
      echo "FE Image (latest):    ${env.FRONTEND_LATEST}"
      echo "BE Image (versioned): ${env.BACKEND_VERSIONED}"
      echo "BE Image (latest):    ${env.BACKEND_LATEST}"
    }
  }
}

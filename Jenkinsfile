
pipeline {
  agent any

  environment {
    DOCKER_BIN = '/usr/local/bin/docker'

    DOCKER_REPO = 'akhilballa112'
    REPO_NAME   = 'chat-app'

    FRONTEND_TAG = 'frontend'
    BACKEND_TAG  = 'backend'
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
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
                                          usernameVariable: 'DOCKER_USER',
                                          passwordVariable: 'DOCKER_PASS')]) {

          script {
            env.DOCKER_BUILD_CONFIG = "${env.WORKSPACE}/.docker-temp"
          }

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

            echo "Logging in to Docker Hub..."
            printf "%s" "$DOCKER_PASS" | "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" login --username "$DOCKER_USER" --password-stdin
            echo "Docker login successful."
          '''
        }
      }
    }

    stage('Build Frontend Image') {
      steps {
        dir('client') {
          script {
            env.FRONTEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:${FRONTEND_TAG}"
          }

          sh '''
            echo "Building frontend image: ${FRONTEND_IMAGE}"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" build -t "${FRONTEND_IMAGE}" .
          '''
        }
      }
    }

    stage('Build Backend Image') {
      steps {
        dir('server') {
          script {
            env.BACKEND_IMAGE = "${DOCKER_REPO}/${REPO_NAME}:${BACKEND_TAG}"
          }

          sh '''
            echo "Building backend image: ${BACKEND_IMAGE}"
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" build -t "${BACKEND_IMAGE}" .
          '''
        }
      }
    }

    stage('Push Images to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
                                          usernameVariable: 'DOCKER_USER',
                                          passwordVariable: 'DOCKER_PASS')]) {

          sh '''
            echo "Ensuring login before push..."
            printf "%s" "$DOCKER_PASS" | "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" login --username "$DOCKER_USER" --password-stdin

            echo "Pushing frontend latest..."
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${FRONTEND_IMAGE}"

            echo "Pushing backend latest..."
            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" push "${BACKEND_IMAGE}"

            "$DOCKER_BIN" --config "${DOCKER_BUILD_CONFIG}" logout || true
          '''
        }
      }
    }

    stage('Cleanup') {
      steps {
        sh '''
          rm -rf "${DOCKER_BUILD_CONFIG}" || true
          echo "Cleaned Docker temp config."
        '''
      }
    }
  }

  post {
    always {
      echo "Build finished."
      echo "Frontend pushed as: ${env.FRONTEND_IMAGE}"
      echo "Backend pushed as : ${env.BACKEND_IMAGE}"
    }
  }
}

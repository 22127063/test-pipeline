pipeline {
    agent any

    environment {
        // Define variables
        DOCKER_IMAGE_NAME = 'test-pipeline'
        DOCKER_REPO = '22127063'
        GIT_REPO = 'https://github.com/22127063/test-pipeline.git'
        DOCKER_TAG = "latest"  // You can replace this with dynamic tag if needed
    }

    stages {
        stage('Download code') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'a66a3a5c-556f-4152-ba39-aafdeb706ad2', url: 'https://github.com/22127063/test-pipeline.git']])
                echo 'Hello World!'
            }
        }

        stage('Pull Code') {
            steps {
                script {
                    // Clone the GitHub repository
                    git branch: 'main', url: "${GIT_REPO}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile
                    sh "docker build -t ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Publish to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    }

                    // Push the Docker image to Docker Hub
                    sh "docker push ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:${DOCKER_TAG}"
                }
            }
        }

        stage('Deploy to Container') {
            steps {
                script {
                    // Deploy the Docker image to a container
                    // Make sure to replace with your actual container deployment command
                    sh """
                    docker run -d --name ${DOCKER_IMAGE_NAME}-container -p 8080:8080 ${DOCKER_REPO}/${DOCKER_IMAGE_NAME}:${DOCKER_TAG}
                    """
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images and containers after the pipeline
            sh 'docker system prune -f'
        }
    }
}
pipeline {
    agent any

    environment {
        // Define variables
        DOCKER_IMAGE_NAME = 'test-pipeline'
        DOCKER_REPO = '22127063'
        GIT_REPO = 'https://github.com/22127063/test-pipeline.git'
        DOCKER_TAG = "latest"  // You can replace this with dynamic tag if needed
        DOCKER_IMAGE = ''
        REGISTRY = '22127063/test-pipeline'
        REGISTRY_CREDENTIAL = '6d444422-d618-49db-ac39-7092a1c13edc'
    }

    stages {
        stage('Download code') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'a66a3a5c-556f-4152-ba39-aafdeb706ad2', url: 'https://github.com/22127063/test-pipeline.git']])
            }
        }

        stage('Verify Docker') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    DOCKER_IMAGE = docker.build REGISTRY
                }
            }
        }

        stage('Upload to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('', REGISTRY_CREDENTIAL) {
                        DOCKER_IMAGE.push()
                    }
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
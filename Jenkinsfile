pipeline {
    agent any
    stages {
        stage('Download code') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'a66a3a5c-556f-4152-ba39-aafdeb706ad2', url: 'https://github.com/22127063/test-pipeline.git']])
                echo 'Hello World!'
            }
        }

        stage('Build code') {
            steps {
                echo 'Building..'
            }
        }
    }
}
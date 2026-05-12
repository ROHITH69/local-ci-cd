pipeline {

    agent any

    stages {

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r app/requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh './scripts/test.sh'
            }
        }

        stage('Lint Check') {
            steps {
                sh './scripts/lint.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh './scripts/build.sh'
            }
        }

        stage('Security Scan') {
            steps {
                sh './scripts/scan.sh'
            }
        }

        stage('OPA Policy Validation') {
            steps {
                sh 'conftest test policies/deployment.yaml --policy policies/'
            }
        }

        stage('Deploy Container') {
            steps {
                sh './scripts/deploy.sh'
            }
        }
    }
}
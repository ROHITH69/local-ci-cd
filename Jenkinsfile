pipeline {

    agent any

    options {
        timestamps()
    }

    stages {

        stage('Verify Tools') {
            steps {
                sh 'docker --version'
                sh 'python3 --version'
                sh 'trivy --version'
                sh 'conftest --version'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh './scripts/setup.sh'
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

        stage('Push Image') {
            steps {
                sh './scripts/push.sh'
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

    post {

        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

        always {
            archiveArtifacts artifacts: 'reports/*', fingerprint: true
            cleanWs()
        }
    }
}
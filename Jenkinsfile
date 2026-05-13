pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 15, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    environment {
        IMAGE_NAME = "sample-python-app"
        IMAGE_TAG = "v1"
        REGISTRY = "localhost:5001"
        KUBECONFIG = "${WORKSPACE}/kubeconfig"
    }

    stages {

        stage('Clone Repository') {
            steps {
                retry(2) {
                    checkout scm
                }
            }
        }

        stage('Verify Tools') {
            steps {
                sh 'docker --version'
                sh 'python3 --version'
                sh 'trivy --version'
                sh 'conftest --version'
                sh 'kubectl version --client'
            }
        }

        stage('Code Validation') {
            steps {
                sh 'test -d app'
                sh 'test -d tests'
                sh 'test -f Dockerfile'
                sh 'python3 -m py_compile app/app.py'
            }
        }

        stage('Install Dependencies') {
            steps {
                retry(2) {
                    sh './scripts/setup.sh'
                }
            }
        }

        stage('Quality Checks (Parallel)') {
            parallel {

                stage('Run Tests') {
                    steps {
                        retry(2) {
                            sh './scripts/test.sh'
                        }
                    }
                }

                stage('Lint Check') {
                    steps {
                        retry(2) {
                            sh './scripts/lint.sh'
                        }
                    }
                }

                stage('Security Scan') {
                    steps {
                        retry(2) {
                            sh './scripts/scan.sh'
                        }
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                retry(2) {
                    sh './scripts/build.sh'
                }
            }
        }

        stage('Push & Policy Validation (Parallel)') {
            parallel {

                stage('Push Image') {
                    steps {
                        retry(2) {
                            sh './scripts/push.sh'
                        }
                    }
                }

                stage('OPA Policy Validation') {
                    steps {
                        retry(2) {
                            sh 'conftest test policies/deployment.yaml --policy policies/'
                        }
                    }
                }
            }
        }

        stage('Kubernetes Deployment') {
            steps {
                retry(2) {
                    sh 'kubectl apply -f policies/deployment.yaml'
                }
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
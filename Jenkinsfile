pipeline {
    agent { label 'k8s-master' }
    stages {
        stage('Clone Repository') {
            steps {
                sh 'git clone https://github.com/afzalhaider1/beginner-html-site-styled.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'nerdctl build -t afzalhaider1/webapp:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub']) {
                    sh 'docker push afzalhaider1/webapp:latest'
                }
            }        
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deploy.yml'
                sh 'kubectl apply -f svc.yml'
            }
        }
    }
}


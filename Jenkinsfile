pipeline {
    agent { label 'k8s-master' }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'gh-pages', url: 'https://github.com/afzalhaider1/beginner-html-site-styled.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t afzalhaider1/webapp:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub']) {
                    sh 'sudo docker push afzalhaider1/webapp:latest'
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


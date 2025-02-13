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
                sh 'sudo docker rmi -f $(sudo docker images "webapp" -q)'
                sh 'sudo docker build -t afzalhaider1/webapp:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'sudo docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"'
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


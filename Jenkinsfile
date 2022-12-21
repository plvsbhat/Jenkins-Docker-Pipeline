pipeline {
    agent any
    stages {
        stage('remove workspace') {
            steps {
                echo 'command to remove workspace'
                // sh 'sudo rm -rf /home/ubuntu/jenkins/workspace/'
            }
        }
        stage('git pull') {
            steps {
                echo 'pulled the Dockerfile'
                sh 'git clone https://github.com/anup0453/Jenkins-Docker-Pipeline.git'
            }
        }
        stage('Create the image') {
            steps {
                echo 'image created'
                sh 'sudo docker build -t deployment /home/ubuntu/jenkins/workspace/j-d-pipeline/Jenkins-Docker-Pipeline '
            }
        }
        stage('Create Container') {
            steps {
                echo 'Container created and running'
                sh 'sudo docker run -p 8080:8080  deployment'
            }
        }
    }
}

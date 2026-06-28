pipeline {
    agent any

    stages {
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('alpine').inside {
                        sh 'echo Hello from Docker'
                        sh 'cat /etc/os-release'
                    }
                }
            }
        }
    }
}

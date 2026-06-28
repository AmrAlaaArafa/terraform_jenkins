pipeline {
    agent any

    stages {
        stage('Run Docker Container') {
            steps {
                script {
                    // Get the Docker tool installation path
                    def dockerHome = tool 'Docker-Cli'

                    // Add Docker to the PATH
                    env.PATH = "${dockerHome}/bin:${env.PATH}"

                    // Verify Docker
                    sh 'docker --version'

                    // Run a container
                    docker.image('alpine').inside {
                        sh 'echo Hello from Docker'
                        sh 'cat /etc/os-release'
                    }
                }
            }
        }
    }
}

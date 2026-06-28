pipeline {
    agent any

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'stg', 'prod'],
            description: 'Choose Terraform Workspace'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Select Workspace') {
            steps {
                sh """
                terraform workspace select ${params.ENVIRONMENT} || \
                terraform workspace new ${params.ENVIRONMENT}
                """
            }
        }

        stage('Terraform Apply') {
            steps {
                sh """
                terraform apply \
                -var="environment=${params.ENVIRONMENT}" \
                -auto-approve
                """
            }
        }
    }

    post {
        success {
            echo "Terraform applied successfully to ${params.ENVIRONMENT}"
        }

        failure {
            emailext(
                to: 'zozowaleed122@gmail.com',
                subject: "Terraform Pipeline Failed",
                body: "Workspace: ${params.ENVIRONMENT}\nBuild: ${env.BUILD_URL}"
            )
        }
    }
}

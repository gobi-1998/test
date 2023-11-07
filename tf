
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/terraforms
[Pipeline] {
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: AKIA2QKTHMB2I5CZLFVO
Finished: FAILURE

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIA2QKTHMB2I5CZLFVO')
        AWS_SECRET_ACCESS_KEY = credentials('1dn3qVUpBCpQPdzQX8DLIzEruxIJEo+6OQkbEF6u')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform scripts from GitHub
                sh 'git clone https://github.com/sanjayguruji/terraform/blob/main/EC2-Instance-with-ebs-vol.tf /var/lib/jenkins/workspace/terraforms'
            }
        }

        stage('Terraform') {
            steps {
                dir('terraform-scripts') {
                    // Initialize and apply your Terraform scripts
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}


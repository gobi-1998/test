
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

Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/terraforms
[Pipeline] {
[Pipeline] withCredentials
WARNING: Unknown parameter(s) found for class type 'com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding': keyIdVariable,secretVariable
WARNING: Unknown parameter(s) found for class type 'com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding': keyIdVariable,secretVariable
Masking supported pattern matches of $AWS_ACCESS_KEY_ID or $AWS_SECRET_ACCESS_KEY
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Checkout)
[Pipeline] sh
+ git clone https://github.com/sanjayguruji/terraform/blob/main/EC2-Instance-with-ebs-vol.tf /var/lib/jenkins/workspace/terraforms
Cloning into '/var/lib/jenkins/workspace/terraforms'...
fatal: repository 'https://github.com/sanjayguruji/terraform/blob/main/EC2-Instance-with-ebs-vol.tf/' not found
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Terraform)
Stage "Terraform" skipped due to earlier failure(s)
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: script returned exit code 128
Finished: FAILURE

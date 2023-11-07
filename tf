provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2QKTHMB2HU4KIAB7"
  secret_key = "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"
}
resource "aws_instance" "newweb" {
  ami           = "ami-02e94b011299ef128"
  instance_type = "t2.micro"

  tags = {
    Name = "tf-example"
  }
}

    1  yum updtae
    2  yum update
    3  sudo yum install -y yum-utils
    4  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    5  sudo yum -y install terraform
    6  terraform -help
    7  touch file.txt
    8  yum install vim
    9  vim file.txt
   10  terraform init
   11  mkdir code
   12  vim file.txt
   13  cd code
   14  vim hello.tf
   15  terraform init
   16  ll
   17  terraform validate
   18  terraform plan
   19  terraform apply
   20  vim hello.tf
   21  terraform apply

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('Your-AWS-Access-Key')
        AWS_SECRET_ACCESS_KEY = credentials('Your-AWS-Secret-Key')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform') {
            steps {
                script {
                    // Run Terraform commands using AWS credentials
                    sh 'cd /path/to/terraform/scripts'
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}


pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('Your-AWS-Access-Key')
        AWS_SECRET_ACCESS_KEY = credentials('Your-AWS-Secret-Key')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Clone the GitHub repository with Terraform scripts
                    sh 'git clone https://github.com/yourusername/your-terraform-repo.git /path/to/clone'
                }
            }
        }

        stage('Terraform') {
            steps {
                script {
                    // Run Terraform commands using AWS credentials
                    sh 'cd /path/to/clone'
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}



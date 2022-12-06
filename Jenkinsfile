pipeline {
    agent any
    

    stages {
        stage("Checkout") {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sukengine/jenkins-terraform.git']]])            
          }
        }
        
        //Build
        stage("Build") {
            steps{
                sh 'echo make'
                //sh 'make'
            }
        }
        
        //Test
        stage("Test") {
            steps {
                sh 'echo Test'
                //sh 'make check || true'
                //junit '**/target/*.xml'
            }
        }
        
        //Deploy
        stege("Deploy") {
            steps{
                sh 'echo deploy'
            }
        }
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }
        
        stage ("terraform Action") {
            environment {
                AWS_ACCESS_KEY=credentials('aws_access_key')
                AWS_SECRET_KEY=credentials('aws_secret_key')
            }  
            steps {
                echo "Terraform action is --> plan"
              sh ('terraform apply -var="aws_access_key=$AWS_ACCESS_KEY" -var="aws_secret_key=$AWS_SECRET_KEY" --auto-approve') 
           }
        }
    }
}

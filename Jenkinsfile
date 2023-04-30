pipeline{
  agent any
  
  environment{
    imagename="mmidlaj/banking"
    registryCredential = 'Docker'
    dockerImage = ''
       
  }

  tools
  {
    maven 'M2_HOME'
  }
  stages{
    stage('Checkout'){
      steps{
        echo 'Checkout the source code'
       git branch: 'main', url: 'https://github.com/mmiitthhuuzz/banking.git'
      }
    }

    stage('Build'){
      steps{
        echo 'Packaging'
        sh 'mvn clean package'
      }
    }

    stage('Generate test report'){
      steps{
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/banking/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Test Report', reportTitles: '', useWrapperFileDirectly: true])
      }
    }

 
 /*   stage('Build image') {
      steps{
         sh ' docker build -t  mmidlaj/banking:latest .'
       }
    }
    stage('DockerLogin') {
      steps {
            withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        }
     }
  }

     stage('Terraform init'){
        steps {
            sh 'terraform init'
              }

     }    
	  
	  stage('Terraform fmt'){
        steps {
            sh 'terraform fmt'
              }

     }    


      stage('Terraform validate'){
        steps {
            sh 'terraform validate'

              }

     }

            stage('Terraform plan'){
        steps {
            sh 'terraform plan'
              }

     }

     stage('Terraform apply'){
        steps {
            sh 'terraform apply -auto-approve'
              } 
	   }

     stage ('Configure Prod-server with Terraform, Ansible and then Deploying'){
            steps {
                sh 'chmod 600 Keypair.pem'
                sh 'terraform init'
                sh 'terraform validate'
                sh 'terraform apply --auto-approve'
                  }        
}
} */
}

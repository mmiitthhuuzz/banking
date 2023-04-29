pipeline{
  agent any
  
  environment{
    imagename="vijayalakshmis/banking"
    registryCredential = 'Docker'
    dockerImage = ''
//    AWS_ACCESS_KEY_ID = ''
  //  AWS_SECRET_ACCESS_KEY = ''
    //AWS_DEFAULT_REGION = 'us-east-1'
       
  }

  tools
  {
    maven 'MAVEN_3'
  }
  stages{
    stage('Checkout'){
      steps{
        echo 'Checkout the source code'
        git 'https://github.com/vijayalakshmi-github/banking.git'
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

 
    stage('Build image') {
      steps{
         sh ' docker build -t  mmidlaj/banking:latest '
       }
    }
    stage('DockerLogin') {
      steps {
            withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        }
     }
  }
    
}
}

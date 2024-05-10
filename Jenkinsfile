pipeline {
  agent any
  stages {
    stage ('test') {
      steps {
        bat 'docker ps -a'
      }
    }
    //stage ('Run Docker Compose') {
    //   steps {
    //     bat 'docker-compose up  -d'
    //   }
    // }
    stage ('Deploy') {
      steps {
        withCredentials([file(credentialsId: 'kubeConfig', variable: 'KUBECONFIG')]) {
          script {
              // Déployer sur Kubernetes
              bat 'kubectl apply -f deploymentMysql.yaml'
              bat 'kubectl apply -f deploymentPhp.yaml'
          }
        }
      }
    }
  }
  post {
    success {
      slackSend channel: '#projet', message: 'Code execute'
    }
    failure {
      slackSend channel: '#projet', message: 'Code execute with error'
    }
  }
}

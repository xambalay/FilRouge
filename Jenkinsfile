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
        withCredentials([file(credentialsID: 'kubeConfig', variable: 'KUBECONFIG')]) {
          script {
              // Déployer sur Kubernetes
              bat 'kubectl apply -f components.yaml --kubeconfig=${KUBECONFIG} --validate=false '
              bat 'kubectl apply -f db-deployment.yml --kubeconfig=${KUBECONFIG} --validate=false'
              bat 'kubectl apply -f web-deployment.yml --kubeconfig=${KUBECONFIG} --validate=false'
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

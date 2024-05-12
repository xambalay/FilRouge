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
        withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
          // Déployer sur Kubernetes
          bat 'kubectl apply -f pvcMysql.yaml --kubeconfig=%KUBECONFIG% --validate=false'
          bat 'kubectl apply -f pvcPhp.yaml --kubeconfig=%KUBECONFIG% --validate=false'
          bat 'kubectl apply -f deploymentMysql.yaml --kubeconfig=%KUBECONFIG% --validate=false'
          bat 'kubectl apply -f deploymentPhp.yaml --kubeconfig=%KUBECONFIG% --validate=false'
          bat 'kubectl apply -f serviceMysql.yaml --kubeconfig=%KUBECONFIG% --validate=false'
          bat 'kubectl apply -f servicePhp.yaml --kubeconfig=%KUBECONFIG% --validate=false'
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

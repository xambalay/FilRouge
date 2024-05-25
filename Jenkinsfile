pipeline {
  agent any
  stages {
    stage ('test') {
      steps {
        sh 'docker ps -a'
      }
    }
    stage ('Deploy') {
      steps {
        withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
          // Déployer sur Kubernetes
          sh 'kubectl apply -f pvcMysql.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'kubectl apply -f pvcPhp.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'kubectl apply -f deploymentMysql.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'kubectl apply -f deploymentPhp.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'kubectl apply -f serviceMysql.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'kubectl apply -f servicePhp.yaml --kubeconfig=${KUBECONFIG} --validate=false'
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

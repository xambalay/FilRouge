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
          sh 'sudo kubectl apply -f pvcMysql.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'sudo kubectl apply -f pvcPhp.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'sudo kubectl apply -f deploymentMysql.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'sudo kubectl apply -f deploymentPhp.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'sudo kubectl apply -f serviceMysql.yaml --kubeconfig=${KUBECONFIG} --validate=false'
          sh 'sudo kubectl apply -f servicePhp.yaml --kubeconfig=${KUBECONFIG} --validate=false'
        }
      }
    }
    stage('SonarQube analysis') {
          steps {
              script{
                   scannerHome = tool 'sonarscanner'
              }
             
             withSonarQubeEnv('sonarqube') {// If you have configured more than one global server connection, you can specify its name as configured in Jenkins
                 bat """
                    ${scannerHome}/bin/sonar-scanner \
                    -Dsonar.projectKey=demosonarqube \
                    -Dsonar.projectName="demosonarqube" \
                    -Dsonar.projectVersion=1.0 \
                    -Dsonar.sources=.
                    """
               }
            }
  }
  //post {
    //success {
      //slackSend channel: '#projet', message: 'Code execute'
    //}
    //failure {
      //slackSend channel: '#projet', message: 'Code execute with error'
    //}
  //}
}

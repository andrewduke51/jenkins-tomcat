pipeline {
  environment {
    registry = "andrewduke51/tomcat"
    registryCredential = 'dockerhub'
    dockerImage = 'tomcat'
  }
  agent any
  stages {
    stage('Start') {
      steps {echo "kickoff this build!"}
      }

    stage('Cloning Git') {
      steps {git 'https://github.com/andrewduke51/jenkins-tomcat.git'}
      }

    stage('Building image') {
      steps{
        script {
          dockerimage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential) {
          dockerImage.push()
          }
        }
      }
    }
  }
}

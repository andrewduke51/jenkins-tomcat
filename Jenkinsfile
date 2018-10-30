pipeline {
  environment {
    registry = “andrewduke51/tomcat”
    registryCredential = ‘dockerhub’
    dockerImage = ‘tomcat’
  }
  agent any
  stages {
    stage(‘Cloning Git’) {
      steps {
        git ‘https://github.com/andrewduke51/jenkins-tomcat.git'
      }
    }
    stage(‘Building image’) {
      steps{
        script {
          dockerImage = docker.build registry + “:$BUILD_NUMBER”
        }
      }
    }
    stage(‘Deploy Image’) {
      steps{
        script {
          docker.withRegistry( ‘’, registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
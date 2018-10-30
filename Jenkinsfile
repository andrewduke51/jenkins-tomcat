pipeline {
  environment {
    registry = "andrewduke51/tomcat"
    registryCredential = 'dockerhub'
  }
  agent any
  stages {
    stage('Cloning Git') {
          steps {
            git ‘https://github.com/andrewduke51/jenkins-tomcat.git'

    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}

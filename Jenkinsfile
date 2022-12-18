pipeline {

  environment {
    dockerimagename = "mikeybabs/flask-ee:v1.1"
    dockerImage = ""
    DOCKERHUB_USERNAME = ""
    APP_NAME = ""
    IMAGE_TAG = ""
  }

  agent any

  stages {

    stage('Print Build Number') {
      steps {
        sh "${BUILD_NUMBER}"
      }
    }

    stage('Print Build Number') {
      steps {
        sh "${BUILD_NUMBER}"
      }
    }

    stage('Checkout Source') {
      steps {
        git 'https://github.com/shazforiot/nodeapp_test.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhublogin'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
        }
      }
    }

  }

}

pipeline {

  environment {
    dockerimagename = "mikeybabs/flask-ee"
    dockerImage = ""
    DOCKERHUB_USERNAME = ""
    APP_NAME = ""
    IMAGE_TAG = "${BUILD_NUMBER}"
    IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
    REGISTRY_CREDS = "docker_hub"
  }

  agent any

  stages {

    // stage('Print Build Number') {
    //   steps {
    //     sh "${BUILD_NUMBER}"
    //   }
    // }

    stage('Checkout Source') {
      steps {
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/mikeybeezy/ee-flask-app'
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
               registryCredential = 'docker_hub'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("${BUILD_NUMBER}")
          }
        }
      }
    }

    // stage('Deploying App to Kubernetes') {
    //   steps {
    //     script {
    //       kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
    //     }
    //   }
    // }
    // stage('delete Image') {
    //   steps {
    //     sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
    //     sh "docker rmi ${IMAGE_NAME}:latest"
    //   }
    // }


  }

}

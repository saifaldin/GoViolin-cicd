pipeline {
  agent any
  environment {
    VERSION = "${env.GIT_COMMIT[0..3]}"
    DOCKERHUB_IMAGE = 'saifaldin3388/goviolin-app'
    DOCKERFILE = 'Dockerfile'
  }
  stages {
    // // this stage is unnecessary in this case/project
    // // but would probably be important if there was any tests
    // // that would need to run before pushing anything to dockerhub
    // stage('install packages & test') {
    //   agent { docker 'golang:1.13.8-alpine' }
    //   steps {
    //     sh 'go get -d ./... '
    //     sh 'go build -o goviolinapp'
    //   }
    // }
    stage('docker build & push image') {
      steps {
        script() {
          dockerImage_versioned = docker.build("${DOCKERHUB_IMAGE}:${VERSION}", "-f ${DOCKERFILE} .")
          dockerImage_latest = docker.build("${DOCKERHUB_IMAGE}:latest", "-f ${DOCKERFILE} .")
          docker.withRegistry('https://registry-1.docker.io/v2/', 'dockerhub-credentials') {
            dockerImage_versioned.push()
            dockerImage_latest.push()
          }
        }
      }
    }
  }
}

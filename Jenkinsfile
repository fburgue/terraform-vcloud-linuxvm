library 'cirb'

pipeline {
  agent { label 'middleware' }

  options {
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  stages {
    stage ('Lint') {
      steps {
        checkout scm
        script {
          make = new brussels.bric.Make()
          make.make(target: 'lint', useNixShell: true)
        }
      }
    }
  }
  post {
    cleanup {
      deleteDir()
    }
  }
}

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mkdir build'
                sh 'cd build'
                sh 'make' 
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true 
            }
            post {
                sh 'rm -rf build'
            }
        }
    }
}

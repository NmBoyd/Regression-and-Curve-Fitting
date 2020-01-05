pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mkdir build'
                sh 'cd build'
                sh 'cmake ..'
                sh 'make' 
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true 
            }
            post {
                always {
                    sh 'rm -rf build'
                }
            }
        }
    }
}

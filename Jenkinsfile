pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'git submodule update --init --recursive'
                sh '''#!/bin/bash -l
                    echo $0;
                    mkdir build;
                    cd build;
                    cmake ..;
                    make
                ''' 
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true 
            }
            post {
                always {
                    sh 'rm -rf build'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}

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
            }
            post {
                always {
                    sh 'rm -rf build'
                }
                failure {
                    archiveArtifacts(allowEmptyArchive: false, artifacts: '.build/**/*.xml, .build/**/*.log')
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

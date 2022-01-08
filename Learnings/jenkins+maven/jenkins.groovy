pipeline {
    agent any

    stages{
        stage('hello'){
            steps {
                echo 'hello world'
            }
        }
        stage('hello again'){
            steps {
                echo 'hello world'
                sh 'touch file'
                archiveArtifacts artifacts: 'file', followSymlinks: false
            }
        }
    }
}
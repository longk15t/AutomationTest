pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                script{
                    if(Regression) {
                        echo 'Run regression test'
                    } else {
                        echo 'Run full test'
                    }
                }

            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
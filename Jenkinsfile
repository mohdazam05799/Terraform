pipeline {
    agent any

    stages {
        stage('Stage 1') {
            steps {
                echo 'This is Stage 1'
                githubNotify(
                    status: 'success',
                    message: 'Stage 1 passed'
                )
            }
        }

        stage('Stage 2') {
            steps {
                echo 'This is Stage 2'
                githubNotify(
                    status: 'failure',
                    message: 'Stage 2 failed'
                )
            }
        }

        stage('Stage 3') {
            steps {
                echo 'This is Stage 3'
                githubNotify(
                    status: 'success',
                    message: 'Stage 3 passed'
                )
            }
        }
    }
}

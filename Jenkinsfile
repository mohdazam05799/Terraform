pipeline {
    agent any
    stages {
        stage('prepare') {
            steps {
                echo "This is the prepare stage"
                env.CHECK_EXTERNAL_ID = 'prepare'
            }
        }
        stage('build') {
            steps {
                echo "This is the build stage"
                env.CHECK_EXTERNAL_ID = 'build'
            }
        }
        stage('deploy') {
            steps {
                echo "This is the deploy stage"
                env.CHECK_EXTERNAL_ID = 'deploy'
            }
        }
    }
    
}

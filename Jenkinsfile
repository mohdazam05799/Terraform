pipeline {
    agent any
    stages {
        stage('prepare') {
            steps {
                env.CHECK_EXTERNAL_ID = 'prepare'
                echo "This is the prepare stage"
                
            }
        }
        stage('build') {
            steps {
                env.CHECK_EXTERNAL_ID = 'deploy'
                echo "This is the build stage"
                
            }
        }
        stage('deploy') {
            steps {
                env.CHECK_EXTERNAL_ID = 'deploy'
                echo "This is the deploy stage"
                
            }
        }
    }
    
}

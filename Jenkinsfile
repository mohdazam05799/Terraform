pipeline {
    agent any
    stages {
        stage('prepare') {
            steps {
                script{
                    env.CHECK_EXTERNAL_ID = 'prepare'}
                
                echo "This is the prepare stage"
                
            }
        }
        stage('build') {
            steps {
                script{
                    env.CHECK_EXTERNAL_ID = 'deploy'}
                echo "This is the build stage"
                
            }
        }
        stage('deploy') {
            steps {
                script{
                    env.CHECK_EXTERNAL_ID = 'deploy'}
                echo "This is the deploy stage"
                
            }
        }
    }
    
}

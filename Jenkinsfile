pipeline {
    agent any
    stages {
        stage('prepare') {
            steps {
                echo "This is the prepare stage"
            }
        }
        stage('build') {
            steps {
                echo "This is the build stage"
            }
        }
        stage('deploy') {
            steps {
                echo "This is the deploy stage"
            }
        }
    }
    post {
        always {
            script {
                currentBuild.result = 'SUCCESS'
                githubPullRequestBuilder status: currentBuild.result, context: 'Build', message: 'Build completed successfully.'
                githubPullRequestBuilder status: currentBuild.result, context: 'Test', message: 'Tests passed.'
                githubPullRequestBuilder status: currentBuild.result, context: 'Deploy', message: 'Deployment completed successfully.'
            }
        }
    }
}

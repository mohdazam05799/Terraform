pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Define the context for the status check
                script {
                    env.GITHUB_STATUS_CONTEXT = 'build'
                }
                // Run the build steps
                echo 'make build'
            }
        }
        stage('Test') {
            steps {
                // Define the context for the status check
                script {
                    env.GITHUB_STATUS_CONTEXT = 'test'
                }
                // Run the test steps
                echo 'make test'
            }
        }
    }
    post {
        // Publish the status check to GitHub
        success {
            script {
                githubSetCommitStatus context: env.GITHUB_STATUS_CONTEXT, state: 'SUCCESS', description: 'Build succeeded', targetUrl: env.BUILD_URL
            }
        }
        failure {
            script {
                githubSetCommitStatus context: env.GITHUB_STATUS_CONTEXT, state: 'FAILURE', description: 'Build failed', targetUrl: env.BUILD_URL
            }
        }
    }
}

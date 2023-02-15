pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def check = buildGithubCheck name: 'Build', status: 'in_progress'
                    try {
                        echo 'make build'
                        check = check.update(status: 'completed', conclusion: 'success', output: [title: 'Build', summary: 'Build successful'])
                    } catch (e) {
                        check = check.update(status: 'completed', conclusion: 'failure', output: [title: 'Error', summary: 'Error occurred during Build stage'])
                        throw e
                    } finally {
                        env.CHECK_EXTERNAL_ID = 'Build'
                        env.CHECK_CONCLUSION = check.conclusion
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    def check = buildGithubCheck name: 'Test', status: 'in_progress'
                    try {
                        echo 'make test'
                        check = check.update(status: 'completed', conclusion: 'success', output: [title: 'Test', summary: 'Test successful'])
                    } catch (e) {
                        check = check.update(status: 'completed', conclusion: 'failure', output: [title: 'Error', summary: 'Error occurred during Test stage'])
                        throw e
                    } finally {
                        env.CHECK_EXTERNAL_ID = 'Test'
                        env.CHECK_CONCLUSION = check.conclusion
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    def check = buildGithubCheck name: 'Deploy', status: 'in_progress'
                    try {
                        echo 'make deploy'
                        check = check.update(status: 'completed', conclusion: 'success', output: [title: 'Deploy', summary: 'Deployment successful'])
                    } catch (e) {
                        check = check.update(status: 'completed', conclusion: 'failure', output: [title: 'Error', summary: 'Error occurred during Deploy stage'])
                        throw e
                    } finally {
                        env.CHECK_EXTERNAL_ID = 'Deploy'
                        env.CHECK_CONCLUSION = check.conclusion
                    }
                }
            }
        }
    }
    post {
        always {
            buildGithubCheck name: env.CHECK_EXTERNAL_ID, status: 'completed', conclusion: env.CHECK_CONCLUSION, output: [title: env.CHECK_EXTERNAL_ID, summary: "${env.CHECK_EXTERNAL_ID} stage ${env.CHECK_CONCLUSION}"]
        }
    }
}

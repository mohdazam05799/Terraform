@Library('github.com/jenkinsci/github-branch-source-plugin@master')
import org.jenkinsci.plugins.github_branch_source.GitHubStatusNotification

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Running Build stage'
            }
            post {
                success {
                    script {
                        def status = new GitHubStatusNotification()
                        status.updateGitHubStatus(
                            context: 'Jenkins Pipeline - Build',
                            state: 'SUCCESS',
                            message: 'Build stage completed successfully',
                            url: env.BUILD_URL,
                            sha: env.GIT_COMMIT
                        )
                    }
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Running Test stage'
            }
            post {
                success {
                    script {
                        def status = new GitHubStatusNotification()
                        status.updateGitHubStatus(
                            context: 'Jenkins Pipeline - Test',
                            state: 'SUCCESS',
                            message: 'Test stage completed successfully',
                            url: env.BUILD_URL,
                            sha: env.GIT_COMMIT
                        )
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Running Deploy stage'
            }
            post {
                success {
                    script {
                        def status = new GitHubStatusNotification()
                        status.updateGitHubStatus(
                            context: 'Jenkins Pipeline - Deploy',
                            state: 'SUCCESS',
                            message: 'Deploy stage completed successfully',
                            url: env.BUILD_URL,
                            sha: env.GIT_COMMIT
                        )
                    }
                }
            }
        }
    }
}

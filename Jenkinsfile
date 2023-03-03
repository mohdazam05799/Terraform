pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                script {
                    updateCheck("Build", "in_progress")
                    // Build steps here
                }
            }
        }
        stage('Test') {
            steps {
                echo "Testing..."
                script {
                    updateCheck("Test", "in_progress")
                    // Test steps here
                }
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying..."
                script {
                    updateCheck("Deploy", "in_progress")
                    // Deploy steps here
                }
            }
        }
    }
}

def updateCheck(stageName, status) {
    
//     def git = checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'src']], userRemoteConfigs: [[credentialsId: github.id, url: 'https://github.com/your-org/your-repo.git']]])
    def sha = git.GIT_COMMIT
    def githubApiUrl = "https://api.github.com/repos/mohdazam05799/Terraform/check-runs"
    def payload = [
        name: stageName,
//         head_sha: sha,
        status: status
    ]
    sh "curl  -H 'Accept: application/vnd.github.antiope-preview+json' -d '${payload}' '${githubApiUrl}'"
}

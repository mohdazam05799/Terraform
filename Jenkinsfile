pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Running Build Stage"
                // Your build steps here
            }
            post {
                always {
                    updateGitHubCheck('Build')
                }
            }
        }
        stage('Test') {
            steps {
                echo "Running Test Stage"
                // Your test steps here
            }
            post {
                always {
                    updateGitHubCheck('Test')
                }
            }
        }
        stage('Deploy') {
            steps {
                echo "Running Deploy Stage"
                // Your deploy steps here
            }
            post {
                always {
                    updateGitHubCheck('Deploy')
                }
            }
        }
    }
}

def updateGitHubCheck(String stageName) {
    def github = ('github')
    //def git = checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'src']], userRemoteConfigs: [[credentialsId: github.id, url: 'https://github.com/your-org/your-repo.git']]])
   // def sha = git.GIT_COMMIT
    def githubApiUrl = "https://api.github.com/repos/mohdazam05799/Terraform/check-runs"
    def payload = """
        {
            "name": "Your Check Name",
           
            "status": "completed",
            "conclusion": "success",
            "output": {
                "title": "Your Check Title",
                "summary": "Your Check Summary",
                "text": "${stageName} Stage completed successfully"
            }
        }
    """
    def response = httpRequest(
        acceptType: 'APPLICATION_JSON',
        contentType: 'APPLICATION_JSON',
        httpMode: 'POST',
        url: githubApiUrl,
        requestBody: payload,
        authentication: github
    )
    echo "Response status: ${response.status}"
}

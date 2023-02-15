node {
    timestamps{
        try{
            stage('Preparation') {
                dir("${WORKSPACE}/${BUILD_ID}") {
                    sh '''
                    echo preflight tasks.....
                    '''
                } 
                steps {
        // Run your build steps here
    }
    post {
        always {
            script {
                // Get the current build status for this stage
                def status = currentBuild.currentResult == 'SUCCESS' ? 'completed' : 'failed'
                def conclusion = currentBuild.currentResult == 'SUCCESS' ? 'success' : 'failure'
                
                // Get the GitHub credentials and repository information
                withCredentials([usernamePassword(credentialsId: 'dec571cb-b5e2-445b-81d5-0740ff29566c',usernameVariable: 'Username', passwordVariable: 'Password')]) {
                    def gitHubUrl = "https://api.github.com"
                    def apiUrl = "${gitHubUrl}/repos/mohd05799/Terraform"
                    
                    // Get the GitHub commit SHA
                    def commitSHA = sh(script: "git rev-parse HEAD", returnStdout: true).trim()
                    
                    // Create the check run using the GitHub Checks API
                    def json = new JsonBuilder()
                    json {
                        name "<check-name>"
                        head_sha commitSHA
                        status status
                        conclusion conclusion
                        completed_at new Date()
                        output {
                            title "<check-title>"
                            summary "<check-summary>"
                        }
                    }
                    def postUrl = "${apiUrl}/check-runs"
                    def response = httpRequest authentication: "${GITHUB_USERNAME}:${GITHUB_ACCESS_TOKEN}", acceptType: 'APPLICATION_JSON', contentType: 'APPLICATION_JSON', httpMode: 'POST', requestBody: json.toString(), url: postUrl
                }
            }
        }
    }
}
            }
            stage('Build') {
                dir("${WORKSPACE}/${BUILD_ID}") {
                    sh '''
                    echo building.....
                    '''
                } 
            }
            stage('Results') {
                dir("${WORKSPACE}/${BUILD_ID}") {
                    sh '''
                    echo FINAL RESULTS!!!!
                    '''
                } 
            }
        }
        catch(Exception ex){
            println "! exception caught !"
            println(ex)
        }
        finally{
            sh '''
            echo this will always be executed....
            '''
        } 
    }
}
 

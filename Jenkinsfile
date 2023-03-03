pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                
                
                
                
            }
            
            post{
                always{
            
                    updatePrStatusLabels((currentBuild.result).toLowerCase())}
            }
           
        }
        
        stage('Test') {
            steps {
                echo "Testing..."
                
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying..."
                
            }
        }
    }
}

def getStatusContext(buildName) {
    switch (buildName) {
        case 'Build':       return 'pr-merge/build'
        case 'Test':          return 'Test'
        case 'Deploy':         return 'Deploy'
    }

    return ''
}

def updateStatus(buildName, newStatus, url = '', customDesc = '') {

    // github handles only 3 statuses; other - just internal variations
    def statusPending = 'pending'
    def statusSuccess = 'success'
    def statusFailure = 'failure'

    if (url == '')
        url = env.BUILD_URL

    def context = getStatusContext(buildName)
    if (!context) {
        echo "Status: ${newStatus}: Unable to get Context for ${buildName}"
        return
    }


    pullRequest.createStatus(newStatus, context, description.take(120), url)

}

def updatePrStatusLabels(newStatus) {
    def builds = ['Build', 'Test', 'Deploy']
    for (buildName in builds)
        updateStatus(buildName, newStatus)

    

    
}

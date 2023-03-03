pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                
                updatePrStatusLabels('wait')
                
                
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

    def description = ''
    switch (newStatus) {
        // special
        case 'wait':
            description = 'Automatic check suppressed, waiting for a command'
            newStatus = statusPending
            break
        case 'skip':
            description = '[SKIPPED]'
            newStatus = statusSuccess
            break
        case 'repo failed':
            description = 'Repo failed to pull with git!'
            newStatus = statusFailure
            break
        case 'aborted':
            description = '[ABORTED] due to unity build failure'
            newStatus = statusFailure
            break
        case 'sanity failed':
            description = '[FAILED] - sanity check failed'
            newStatus = statusFailure
            break
        // triggered
        case 'queued':
            description = '[QUEUED]'
            newStatus = statusPending
            break
        case statusPending:
            description = '[PENDING]'
            break
        case 'running':
            description = '[RUNNING]'
            newStatus = statusPending
            break

        // finished
        case statusSuccess:
            description = '[SUCCEEDED]'
            break
        case statusFailure:
            description = '[FAILED]'
            break
    }


    pullRequest.createStatus(newStatus, context, description.take(120), url)

}

def updatePrStatusLabels(newStatus) {
    def builds = ['Build', 'Test', 'Deploy']
    for (buildName in builds)
        updateStatus(buildName, newStatus)

    

    
}

node {
    stage('Stage 1') {
        echo 'This is Stage 1'
        githubNotify(
            status: 'success',
            message: 'Stage 1 passed'
        )
    }
    stage('Stage 2') {
        echo 'This is Stage 2'
        githubNotify(
            status: 'failure',
            message: 'Stage 2 failed'
        )
    }
    stage('Stage 3') {
        echo 'This is Stage 3'
        githubNotify(
            status: 'success',
            message: 'Stage 3 passed'
        )
    }
}

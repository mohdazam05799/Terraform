node {
    timestamps{
        try{
            stage('Preparation') {
                dir("${WORKSPACE}/${BUILD_ID}") {
                    sh '''
                    echo preflight tasks.....
                    '''
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
 

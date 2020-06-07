def maven(def target){
    sh "mvn $target"
}
pipeline{
    agent any
    options{
        timestamps()
    }
    tools { 
        maven 'Maven 3.6.3'
    }
    stages{
        stage("Build"){
            steps{
                script{
                    sh echo "Hello World"
                }
                script{
                    maven("clean package")
                }
            }
        }
    }
}

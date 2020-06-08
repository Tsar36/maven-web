def maven(def target){
    sh "mvn $target"
}
pipeline{
    agent any
    options{
        timestamps()
    }
    tools { 
        maven 'M3'
    }
    stages{
        stage("Build"){
            steps{
                script{
                    git url: "https://github.com/Tsar36/maven-web.git"
                }
                script{
                    maven("clean package")
                }
            }
        }
    }
}

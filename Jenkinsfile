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
                    git 'https://github.com/Tsar36/maven-web.git'
                }
                script{
                    maven("clean package")
                }
            }
        }
        stage("Upload to Nexus"){ /// info took from pom.xml file in github repo
            steps{
                echo "Ready to DEPLOY"
            }
        }
    }
}

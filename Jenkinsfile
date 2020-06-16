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
                    git 'https://github.com/Tsar36/maven-web.git'
                }
                script{
                    withMaven(maven: 'M3', mavenSettingsConfig: '6a4d887d-917e-4557-8599-ee1643720bf9'){
                        sh "mvn clean package deploy"
                    }
                }
            }
        }
    }
}

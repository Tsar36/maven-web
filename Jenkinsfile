def app
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
                        sh "mv target/*.war target/myweb.war.${BUILD_NUMBER}"
                    }
                }
            }
            post {
                success {
                    echo " The job number ${BUILD_NUMBER} has result SUCCESS"
                    echo "${env.BUILD_URL} has result success"
                }
                failure {
                    echo "The job number ${BUILD_NUMBER} has result FAILURE"
                    echo "${env.BUILD_URL} has result fail"
                }
            }
        }
        
        stage("Build image"){
            steps{
             app = docker.build("tsar36/maven-web")   
            }
        }
        
        stage("Push Image to Docker-Hub"){
            steps{
                withDockerRegistry(credentialsId: 'docker-hub-cec', url: 'https://registry.hub.docker.com/') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                }
            }
        }
    }
}

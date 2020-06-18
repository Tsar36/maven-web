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
            }
                script{
                    withMaven(maven: 'M3', mavenSettingsConfig: '6a4d887d-917e-4557-8599-ee1643720bf9'){
                        sh "mvn clean package deploy"
                        sh "mv target/*.war target/myweb.war"
                    }
                }
        stage("Deploy to tomcat"){
            steps{
                script{
                    sshagent(['tomcat']) {
                        sh """
                        scp -o StrictHostKeyChecking=no target/myweb.war tomcat@34.69.182.55:/opt/tomcat8/webapps
                        ssh tomcat@34.69.182.55 /opt/tomcat8/bin/shutdown.sh
                        ssh tomcat@34.69.182.55 /opt/tomcat8/bin/startup.sh
                        """ }
                    }
                }
            }
        }
    }
}

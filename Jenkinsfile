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
        stage("Upload to Nexus"){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'maven-web', classifier: '', file: 'target/Cyborg Developer Maven Webapp-1.0.war', type: 'war']], credentialsId: 'nexus3-repo', groupId: 'tech.cyborgdeveloper', nexusUrl: '34.69.138.247', nexusVersion: 'nexus3', protocol: 'http', repository: 'http://34.69.138.247:8081/repository/MyPipeLine_Maven-release/', version: '1.0'
            }
        }
    }
}

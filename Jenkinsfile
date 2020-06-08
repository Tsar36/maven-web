pipeline {
	agent any
		tools {
		maven 'maven3'
		}
	stages{
		stage("Build"){
			steps{
				sh script: 'mvn clean package'
			}
		}
		stage("Upload WAR to Nexus"){
			steps{
				nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'maven-web', 
                        classifier: '', 
                        file: 'target/maven-web-1.0.war', 
                        type: 'war'
                    ]
                ], 
                credentialsId: 'nexus3-repo', 
                groupId: 'tech.cyborgdeveloper', 
                nexusUrl: '34.69.138.247:8081', 
                nexusVersion: 'nexus3', 
                protocol: 'http', 
                repository: 'MyPipeLine_Maven-release', 
                version: '1.0'
			}
		}
	}
}

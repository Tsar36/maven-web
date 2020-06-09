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
         stage("Upload to Nexus"){
             steps{
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
                    maven("clean package")
                }
            }
        }
        stage("Upload to Nexus"){
            steps{
                sh 'echo "Ready to deploy"'
                nexusPublisher nexusInstanceId: 'Nexus', nexusRepositoryId: 'MyPipeLine_Maven-release', packages: [[$class: 'Maven', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/***.jar']], mavenCoordinate: [artifactId: 'maven-web', groupId: '***', packaging: 'jar', version: '${BUILD_NUMBER}']]]
            }
        }
    }
}
//                 nexusArtifactUploader artifacts: [
//                     [
//                         artifactId: 'maven-web', 
//                         classifier: '', 
//                         file: 'target/maven-web-1.0.war', 
//                         type: 'war'
//                     ]
//                 ], 
//                 credentialsId: 'nexus3-repo', 
//                 groupId: 'tech.cyborgdeveloper', 
//                 nexusUrl: '34.69.138.247:8081', 
//                 nexusVersion: 'nexus3', 
//                 protocol: 'http', 
//                 repository: 'MyPipeLine_Maven-release', 
//                 version: '1.0'
//             }
//         }
//     }
// }

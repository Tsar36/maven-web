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
//        mavenSettingsConfig: '6a4d887d-917e-4557-8599-ee1643720bf9'
    }
    stages{
        stage("Build"){
            steps{
                script{
                    git 'https://github.com/Tsar36/maven-web.git'
                }
                script{
                    maven("clean package deploy")
                }
            }
        }
        stage("Upload to Nexus"){
            steps{
                sh 'echo "Ready to deploy"'
//                nexusPublisher nexusInstanceId: '3.23.0-03', nexusRepositoryId: 'MyPipeLine_Maven-release', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/maven-web.war']], mavenCoordinate: [artifactId: 'maven-web', groupId: 'tech.cyborgdeveloper', packaging: 'war', version: '1.0.0']]]
            }
        }
    }
}
//   wrong              nexusArtifactUploader artifacts: [
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

FROM openjdk:8
EXPOSE 8080
ADD /var/lib/jenkins/workspace/Docker-build-image/target/*.war.${BUILD_NUMBER} docker-maven-web.war
ENTRYPOINT ["java","-java","docker-maven-web.war"]

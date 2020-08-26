FROM openjdk:8
EXPOSE 8080
ADD target/*.war.${BUILD_NUMBER} docker-maven-web.war
ENTRYPOINT ["java","-java","docker-maven-web.war"]

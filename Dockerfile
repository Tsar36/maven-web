FROM openjdk:8
EXPOSE 8080
ADD target/*.war.${BUILD_NUMBER} doocker-maven-web.war
ENTRYPOINT ["java","-java","doocker-maven-web.war"]

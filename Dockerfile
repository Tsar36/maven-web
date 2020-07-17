FROM openjdk:8
EXPOSE 8080
ADD target/*.jar doocker-maven-web.jar
ENTRYPOINT ["java","-java","doocker-maven-web.jar"]

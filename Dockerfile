FROM openjdk:11
RUN mkdir -p /home/jenkins/cloudeq_docker
WORKDIR /home/jenkins/cloudeq_docker
COPY /home/jenkins/spring-rest-hello-world-1.0.2.jar /home/jenkins/cloudeq_docker/
EXPOSE 8080
CMD ["java", "-jar", "spring-rest-hello-world-1.0.2.jar"]
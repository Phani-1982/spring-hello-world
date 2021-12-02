FROM openjdk:11
RUN mkdir -p /home/jenkins/cloudeq_docker
COPY ./spring-rest-hello-world-1.0.2.jar /home/jenkins/cloudeq_docker/
WORKDIR /home/jenkins/cloudeq_docker
EXPOSE 8081
CMD ["java", "-jar", "spring-rest-hello-world-1.0.2.jar"]
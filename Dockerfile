FROM maven:3-jdk-11 as builder
RUN git clone https://github.com/Phani-1982/spring-hello-world.git
RUN cd /spring-hello-world
WORKDIR /spring-hello-world
RUN mvn clean package


FROM openjdk:11
RUN mkdir -p /home/cloudeq_docker
COPY --from=builder spring-hello-world/target/spring-rest-hello-world-1.0.2.jar /home/cloudeq_docker/
WORKDIR /home/cloudeq_docker
EXPOSE 8081
CMD ["java", "-jar", "spring-rest-hello-world-1.0.2.jar"]
FROM openjdk:17

WORKDIR /app

COPY ./ ./

RUN  chmode +x ./gradlew bootJar 

CMD ["java", "-jar", "/app/build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

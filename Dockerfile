FROM openjdk:17

WORKDIR /app

COPY ./build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar /app/

CMD ["java", "-jar", "/app/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

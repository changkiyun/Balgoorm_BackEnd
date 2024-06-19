FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

COPY . .

RUN ./gradlew clean build

EXPOSE 8080

CMD ["java", "-jar", "build/libs/Balgoorm-BackEnd.jar"]

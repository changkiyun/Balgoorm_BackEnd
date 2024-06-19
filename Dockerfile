FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /app

COPY . /app

RUN ./gradlew clean build

ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]
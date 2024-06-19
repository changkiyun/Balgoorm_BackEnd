FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /home/gradle/app

COPY build.gradle settings.gradle ./
COPY gradle ./gradle

RUN ./gradlew clean build -x test --stacktrace

COPY src ./src

RUN gradle bootJar --stacktrace

FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /app

COPY --from=build /home/gradle/app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

EXPOSE 8080
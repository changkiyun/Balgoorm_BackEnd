FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

COPY . .

# Gradle Wrapper에 실행 권한 부여
RUN chmod +x ./gradlew

RUN ./gradlew clean build

EXPOSE 8080

CMD ["java", "-jar", "build/libs/Balgoorm-BackEnd.jar"]

FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

COPY . .

RUN chmod +x ./gradlew

# 프록시 설정 추가
ENV http_proxy=http://localhost:3000
ENV https_proxy=http://localhost:3000

RUN ./gradlew clean build

EXPOSE 8080

CMD ["java", "-jar", "/app/build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

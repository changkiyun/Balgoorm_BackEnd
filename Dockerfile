FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

COPY . .

RUN chmod +x ./gradlew

# 프록시 설정 추가
ENV http_proxy=ws://localhost:8080/chat/**
ENV https_proxy=ws://localhost:8080/chat/**

RUN ./gradlew clean build

EXPOSE 8080

CMD ["java", "-jar", "/app/build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

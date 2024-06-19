FROM openjdk:17

WORKDIR /app

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y xargs

COPY . .

# gradlew에 실행 권한 부여
RUN chmod +x gradlew

# Gradle 캐시를 활용하여 빌드 시간 단축
RUN ./gradlew bootJar

CMD ["java", "-jar", "/app/build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

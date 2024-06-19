FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /app

# 필요한 Gradle Wrapper 파일들을 먼저 복사합니다
COPY gradle /app/gradle
COPY gradlew /app/gradlew
#COPY gradle.properties /app/gradle.properties
COPY settings.gradle /app/settings.gradle
COPY build.gradle /app/build.gradle

# 필요한 소스 파일들을 복사합니다
COPY src /app/src

# gradlew에 실행 권한 부여
RUN chmod +x gradlew

# Gradle 캐시를 활용하여 빌드 시간 단축
RUN ./gradlew bootJar

CMD ["java", "-jar", "/app/build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

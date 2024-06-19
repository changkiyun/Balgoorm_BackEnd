FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

# 모든 파일 복사
COPY . .

# Gradle Wrapper에 실행 권한 부여
RUN chmod +x ./gradlew

# Gradle 빌드 실행
RUN ./gradlew clean build

EXPOSE 8080
CMD ["java", "-jar", "build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

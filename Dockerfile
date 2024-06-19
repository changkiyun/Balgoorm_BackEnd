FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

# 필요한 파일을 복사
COPY . .

# Gradle Wrapper에 실행 권한 부여
RUN chmod +x ./gradlew

# 로컬 시스템에서 다운로드한 종속성을 복사
COPY .gradle /root/.gradle

# Gradle 빌드를 실행하여 종속성을 미리 다운로드
RUN ./gradlew clean build

EXPOSE 8080

CMD ["java", "-jar", "build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

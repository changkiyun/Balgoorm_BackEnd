# 도커파일 jdk17 가져오기
FROM openjdk:17

# 이미지 내에서 애플리케이션 파일을 보관할 디렉토리 생성 및 설정
WORKDIR /app

# 빌드 결과물인 JAR 파일을 Docker 이미지 안으로 복사
COPY ./build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar /app/
COPY ./src/main/resources/application.properties /app/config/

# 컨테이너가 시작될 때 실행할 명령 설정
CMD ["java", "-jar", "/app/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar", "--spring.config.location=/app/config/application.properties"]

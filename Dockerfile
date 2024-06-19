# OpenJDK 17을 사용하여 이미지 생성
FROM openjdk:17

# 빌드된 JAR 파일을 컨테이너의 루트 디렉토리로 복사
COPY build/libs/Balgoorm_BackEnd-0.0.1-SNAPSHOT.jar app.jar

# JAR 파일을 실행하는 명령어 설정
ENTRYPOINT ["java", "-jar", "app.jar"]

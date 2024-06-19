빌드 단계
FROM bellsoft/liberica-openjdk-alpine:17 AS build

WORKDIR /usr/src/app

필요한 파일을 명시적으로 복사
COPY build.gradle settings.gradle gradlew gradlew.bat /usr/src/app/
COPY gradle /usr/src/app/gradle
COPY src /usr/src/app/src
COPY code /usr/src/app/code

Gradle Wrapper에 실행 권한 부여
RUN chmod +x ./gradlew

Gradle 빌드를 실행하여 종속성을 미리 다운로드 및 빌드
RUN ./gradlew clean build

실행 단계
FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

빌드 단계에서 생성된 jar 파일을 복사
COPY --from=build /usr/src/app/build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar ./build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

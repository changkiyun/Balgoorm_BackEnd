FROM bellsoft/liberica-openjdk-alpine:17 AS build

WORKDIR /usr/src/app

COPY . .

RUN chmod +x ./gradlew

RUN ./gradlew clean build

FROM bellsoft/liberica-openjdk-alpine:17

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar ./build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "build/libs/Balgoorm-BackEnd-0.0.1-SNAPSHOT.jar"]

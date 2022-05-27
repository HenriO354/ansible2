FROM openjdk:14-jdk-alpine

WORKDIR /app
COPY . ./
RUN ./gradlew build

ENTRYPOINT ["java", "-jar", "build/libs/caesar-cipher.jar"]
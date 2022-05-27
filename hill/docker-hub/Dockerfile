FROM openjdk:17-jdk-alpine AS builder

WORKDIR /app
COPY . ./
RUN ./mvnw package

FROM openjdk:17-jdk-alpine

WORKDIR /app
COPY --from=builder /app/target/*.jar ./dependancies.jar
ENTRYPOINT [ "java", "-jar", "dependancies.jar" ]
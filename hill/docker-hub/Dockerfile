FROM openjdk:11

WORKDIR /app
COPY .mvn/ ./.mvn
COPY src ./src
COPY mvnw pom.xml ./
RUN ./mvnw package

# FROM openjdk:11

# WORKDIR /app
# COPY --from=builder /app/target/*.jar /app

ENTRYPOINT [ "java", "-jar", "target/*.jar" ]
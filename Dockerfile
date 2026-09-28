FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /workspace

COPY pom.xml .

RUN mvn -q -B dependency:go-offline || true

COPY src ./src

RUN mvn -q -B -DskipTests package

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=build /workspace/target/jenkins-final.jar /app/app.jar

RUN addgroup -S spring && adduser -S spring -G spring

USER spring

EXPOSE 8080

ENTRYPOINT ["java","-XX:+UseContainerSupport","-XX:MaxRAMPercentage=75.0","-jar","/app/app.jar"]


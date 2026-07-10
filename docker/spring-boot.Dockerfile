FROM eclipse-temurin:21-jdk AS build
WORKDIR /workspace
COPY . .
RUN if [ -x ./mvnw ]; then ./mvnw -B clean package -DskipTests; else mvn -B clean package -DskipTests; fi

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /workspace/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]


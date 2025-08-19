# Use the official Maven image to build the application
FROM maven:3.9.6-openjdk-21 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Baixa as dependências do projeto
RUN mvn dependency:go-offline

# Use a smaller base image to run the application
FROM openjdk:21-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file from the previous stage
COPY -- from=build /app/target/ *. jar app.jar

# Expose the application port (default is 8080)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

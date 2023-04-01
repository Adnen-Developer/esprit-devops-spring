# Use the official Maven image as the base image
FROM maven:3.8.3-ibmjava-8-alpine
# Copy the application code to the container
COPY . /app

# Set the working directory to the application directory
WORKDIR /app

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use a Java runtime as the base image
FROM openjdk:8-jre-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the packaged jar file to the container
COPY --from=build /app/target/tpAchatProject-1.0.jar .

# Expose port 8089 for the application
EXPOSE 8089
# Set the command to run when the container starts
CMD ["java", "-jar", "tpAchatProject-1.0.jar"]

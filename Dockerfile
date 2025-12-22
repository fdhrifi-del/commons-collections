# Apache Commons Collections – PIT Mutation Testing
FROM maven:3.9.6-eclipse-temurin-17

WORKDIR /app

# Copy everything
COPY . .

# Run tests + mutation testing
RUN mvn clean test

# Default command (re-run PIT if container is started)
CMD ["mvn", "clean", "test"]

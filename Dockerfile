# Use a base image
FROM ubuntu:latest

# Set environment variables
ENV APP_HOME=/app
ENV CHECK=120
WORKDIR $APP_HOME

# Accept build arguments
ARG DATABASE_HOST_DEV
ARG SPRING_DATASOURCE_USERNAME_DEV


# Set these arguments as environment variables
ENV DATABASE_HOST_DEV=${DATABASE_HOST_DEV}
ENV SPRING_DATASOURCE_USERNAME_DEV=${SPRING_DATASOURCE_USERNAME_DEV}

# Copy a script to print environment variables
COPY print-env.sh .

# Make the script executable
RUN chmod +x print-env.sh

# Run the script when the container starts
CMD ["./print-env.sh"]

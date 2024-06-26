# Specify the base image
FROM python:latest

# Set the working directory inside the container
WORKDIR /app

# Install Zsh and git
RUN apt-get update && apt-get install -y wget git zsh \
    && sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" \
    && rm -rf /var/lib/apt/lists/*

# Use ARG to receive the build-time variables
ARG USER_NAME
ARG USER_EMAIL

# Use the ARG values to configure git
RUN git config --global user.name "${USER_NAME}" \
    && git config --global user.email "${USER_EMAIL}"

# Expose the application port
EXPOSE 8000

# Start Zsh by default
CMD ["zsh"]
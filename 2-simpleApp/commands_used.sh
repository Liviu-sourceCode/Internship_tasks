# Build the Docker image locally
docker build -t python-app .

# Run a Docker container using the built image
docker run --name python-container python-app

# View running Docker containers
docker ps

# View all Docker containers (including stopped ones)
docker ps -a

# Stop a running Docker container
docker stop python-container

# Remove a Docker container
docker rm python-container

# Remove the Docker image
docker rmi python-app

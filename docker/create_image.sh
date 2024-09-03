echo "----------------------------"
echo " building TurtleBot CBF docker image"
echo "----------------------------"

# Replace <github> with your own private github key
DOCKER_BUILDKIT=1 docker build -t ghcr.io/achilleas2942/turtlebot-cbf \
                            --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/github)" \
                            --build-arg SSH_PRIVATE_KEY_PUB="$(cat ~/.ssh/github.pub)" \
                            .
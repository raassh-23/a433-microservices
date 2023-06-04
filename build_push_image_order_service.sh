#!/bin/bash

name="order-service" # Image name
tag="latest" # Image tag
githubPackages="ghcr.io/raassh-23/" # Github container registry path

docker build -t $githubPackages$name:$tag . # Build the image

# Set github pat for authentication
# export CR_PAT=your token with read:packages, write:packages, delete:packages, repo scopes

echo "$CR_PAT" | docker login ghcr.io -u raassh-23 --password-stdin # Login to github container registry

docker push $githubPackages$name:$tag # Push the image to github container registry

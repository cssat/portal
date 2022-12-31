#!/bin/bash

if [ $# -eq 0 ]; then
   echo "No arguments supplied"
   echo "Usage:<script name> repo, tag"
   exit 1
fi

ECR_PUSH_SCRIPT_DIR=$(dirname $(cd "$(dirname "$BASH_SOURCE")"; pwd))
PROJECT_ROOT=$(dirname $(dirname $(cd "$(dirname "$BASH_SOURCE")"; pwd)))
#$AWS_REGION=$1
IMAGE_REPO_NAME=$1
IMAGE_TAG="${2:-latest}"
IMAGE_DOCKERFILE_PATH="${PROJECT_ROOT}/${IMAGE_REPO_NAME}" 
IMAGE_BUILD_CONTEXT_PATH=${PROJECT_ROOT} 

out=$(aws ecr describe-repositories --repository-names ${IMAGE_REPO_NAME} 2>/dev/null)
Status=$?
if [ $Status -gt 0 ]; then
   out=$(aws ecr create-repository --repository-name ${IMAGE_REPO_NAME}) 
   IMAGE_REPO_URI=$(echo $out | jq -r '.repository.repositoryUri')
   aws ecr put-lifecycle-policy --repository-name ${IMAGE_REPO_NAME} \
       --lifecycle-policy-text file://./{$ECR_PUSH_SCRIPT_DIR}/ecr-lifecycle-policy.json
else
   IMAGE_REPO_URI=$(echo $out | jq -r '.repositories[0].repositoryUri')
fi

echo $IMAGE_REPO_URI

if [ -z $IMAGE_REPO_URI ]; then
   echo "Error for ${IMAGE_REPO_NAME}"
   exit 1
fi

IMAGE_REPO_REGISTRY=$(echo $IMAGE_REPO_URI | sed "s/\/$IMAGE_REPO_NAME//")
echo $IMAGE_REPO_REGISTRY

aws ecr get-login-password | docker login --username AWS --password-stdin $IMAGE_REPO_REGISTRY
Status=$?
if [ $Status -gt 0 ]; then
   echo "ecr login failed"
   exit 1;
fi


docker build ${IMAGE_BUILD_CONTEXT_PATH} --file ${IMAGE_DOCKERFILE_PATH}/Dockerfile --tag ${IMAGE_REPO_NAME}:${IMAGE_TAG}
Status=$?
if [ $Status -gt 0 ]; then
   echo "Build failed for ${IMAGE_REPO_NAME}"
   exit 1;
fi

docker tag $IMAGE_REPO_NAME:$IMAGE_TAG ${IMAGE_REPO_URI}:${IMAGE_TAG}
docker push ${IMAGE_REPO_URI}:${IMAGE_TAG}
Status=$?
if [ $Status -gt 0 ]; then
   echo "image push failed for ${IMAGE_REPO_NAME}"
   exit 1;
fi

export $(echo $IMAGE_REPO_NAME | tr '[:lower:]' '[:upper:]')_IMAGE_REPO_URI=$IMAGE_REPO_URI

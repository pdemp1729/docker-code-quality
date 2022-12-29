#!/usr/bin/env bash
set -e

DEFAULT_IMAGE_NAME=${PWD##*/}
DEFAULT_IMAGE_TAG=local

if [ -z ${IMAGE_NAME+x} ]; then
  echo "IMAGE_NAME variable was not set, will use default IMAGE_NAME=${DEFAULT_IMAGE_NAME}"
  export IMAGE_NAME="${DEFAULT_IMAGE_NAME}"
fi

if [ -z ${IMAGE_TAG+x} ]; then
  echo "IMAGE_TAG variable was not set, will use default IMAGE_TAG=${DEFAULT_IMAGE_TAG}"
  export IMAGE_TAG="${DEFAULT_IMAGE_TAG}"
fi

build() {
  export DOCKER_BUILDKIT=1

  set -- --tag "${IMAGE_NAME}:${IMAGE_TAG}"
  set -x
  docker build . "$@"
  set +x
}

clean() {
  set -x
  docker rmi "${IMAGE_NAME}:${IMAGE_TAG}"
  set +x
}

$1

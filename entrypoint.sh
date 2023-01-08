#!/usr/bin/env bash

echo "Running flake8..."
flake8 --config=$DEFAULT_FLAKE8_CONFIG $CODE_DIR

echo "Running isort --check"
isort --settings-file=$DEFAULT_ISORT_CONFIG --src=$CODE_DIR --check $CODE_DIR

echo "Running black --check..."
black --target-version py39 --check $CODE_DIR

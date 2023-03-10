# docker-code-quality
Docker image for checking python code quality

## Usage

After building the docker image using `./docker.sh build` it can be used to run [flake8](https://flake8.pycqa.org/en/6.0.0/index.html),
[black](https://black.readthedocs.io/en/stable/index.html) and [isort](https://pycqa.github.io/isort/index.html)
(in check mode) on a codebase of your choosing.
In particular, assuming you're in the directory of the code you want to check, simply run

```
docker run --rm -t -v $(pwd):/code docker-code-quality:{IMAGE_TAG}
```

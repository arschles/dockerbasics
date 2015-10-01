# dockerbasics

Training code for basic docker operations

# Tutorial 1: Running an ad-hoc container (2 minutes)

This tutorial dynamically loads our python code into a _container volume_, then runs it.
After the container runs, it will immediately exit and disappear. This approach is good
for quick testing, but does not produce reusable images complete with our application code & configuration.

Use the following command to run the python code:

```sh
docker run -v $PWD:/dir -w /dir python:3.5.0-slim python sample.py
```

Explanation of command line flags:

- `-v $PWD:/dir` - allows the container to see everything in the current working directory (`$PWD`). The contents
will be in the `/dir` directory inside the container
- `-w /dir` - sets the container's current working directory to `/dir`
- `python:3.5.0-slim` - tells the Docker daemon to run all of the following arguments as commands inside of the
[python image with the 3.5.0 tag](https://hub.docker.com/r/library/python/tags/)
- `python sample.py` - the command to run inside the container

# Tutorial 2: Creating and image and running a container (5 minutes)

This tutorial creates an image with our code (the same as in tutorial 2) and configuration,
then runs the image in a container. This approach is good for packaging up your _entire_
application for distributing it to run.

## Building the image
Use the following command to create your image:

```sh
docker build -t dockerbasics/testpy:0.1 .
```

At this point, you have built an image (`dockerbasics/testpy:0.1`) that is stored on your filesystem and ready
to be executed in a container. The image contains the Python code (your application) and the command necessary to run
that Python code (config).

Explanation of command line flags:

- `-t` - use the following value to set the name and tag of the image
- `dockerbasics/testpy:0.1`: the name (`dockerbasics/testpy`) and tag (`0.1`) of the image
- `.` - where to find the Dockerfile, which is the template for how to build the image (see the file itself for explanation)

## Run the image in a container
Use the following command to run your image inside a container:

```sh
docker run --rm dockerbasics/testpy:0.1
```

Explanation of command line flags:

- `--rm` - remove all container data (e.g. logs, auditing data) after execution finishes
- `dockerbasics/testpy:0.1` - the image to run

# this file is the template from which to create our own production-ready image

# the image on which to base this one
FROM python:3.5.0

# creates a directory inside the image
RUN mkdir /py

# adds a file from the host filesystem into the image
ADD sample.py /py/sample.py

# tells the image to run this command when the image is run in a container. can be overridden at container runtime
CMD python /py/sample.py

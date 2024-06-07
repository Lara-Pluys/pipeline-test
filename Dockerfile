# Using official python runtime base image
FROM image-registry.openshift-image-registry.svc:5000/openshift/python:latest

# Set the working directory
WORKDIR /opt/app-root/src

# Install our requirements.txt
ADD requirements.txt /opt/app-root/src/requirements.txt
RUN pip install -r requirements.txt

# Copy our code from the current folder to /opt/app-root/src inside the container
ADD . /opt/app-root/src

# Make port 8080 available for links and/or publish
EXPOSE 8080

# Define our command to be run when launching the container
CMD ["uvicorn", "app:app", "--host", "127.0.0.1", "--port", "8080"]


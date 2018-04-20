FROM quay.io/keboola/docker-custom-python:1.5.4

WORKDIR /home

# Initialize the transformation runner
COPY . /home/

# Run the application
ENTRYPOINT python -u ./main.py --data=/data/

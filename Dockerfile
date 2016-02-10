FROM quay.io/keboola/base-python:3.5.1-c
MAINTAINER Ondrej Popelka <ondrej.popelka@keboola.com>

WORKDIR /home

# Initialize the transformation runner
COPY . /home/

RUN yum -y update \
	&& yum -y install \
		numpy \
		scipy \
		python-matplotlib \
		ipython \
		python-pandas \
		sympy \
		python-nose\
	&& yum clean all

# Install some commonly used packages and the Python application
RUN pip install --no-cache-dir --ignore-installed --cert=/usr/cacert.pem \
		PyYaml \
		httplib2 \
		pymongo \
		ipython \
		numpy \
		matplotlib \
	&& pip install --upgrade --no-cache-dir --ignore-installed --cert=/usr/cacert.pem git+git://github.com/keboola/python-docker-application.git

# Run the application
ENTRYPOINT python ./main.py --data=/data/

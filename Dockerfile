FROM ubuntu:latest
MAINTAINER lingojuyogesh.kumar@ltts.com
RUN apt-get update && apt-get install -y \
	gcc \
	python3.7 \
	python3-pip 
RUN pip3 install pycodestyle &&\
	pip3 install --upgrade pycodestyle &&\
	pip3 install autopep8

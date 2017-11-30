FROM python:3
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y \
    binutils \
    libproj-dev \
    gdal-bin
RUN mkdir /src
WORKDIR /src
ADD requirements.txt /src/
RUN pip install -r requirements.txt
ADD . /src/
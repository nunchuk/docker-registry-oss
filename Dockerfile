# This file describes how to build a private docker-registry backend Aliyun OSS as the storage
# VERSION 1 - EDITION 0
# Author: Chuck Zhang

FROM registry:0.9.1

MAINTAINER Chuck Zhang <nunchuk@live.com> (@nunchuk)

# Packaged dependencies
RUN apt-get update && apt-get install -y wget unzip 

# Get oss api 
RUN mkdir -p /oss/api && cd /oss/api \
    && wget http://aliyunecs.oss-cn-hangzhou.aliyuncs.com/OSS_Python_API_20140509.zip \
    && unzip OSS_Python_API_20140509.zip && sudo python setup.py install

# Get docker-registry-driver-oss
RUN cd /oss \
    && wget -r -np -nd --no-check-certificate https://github.com/nunchuk/docker-registry-driver-alioss/archive/master.zip \ 
    && unzip master.zip && cd docker-registry-driver-alioss-master/ && sudo python setup.py install

# Clear
RUN \rm -rf /oss

# Add oss config
ADD config_sample.yml /docker-registry/config/config_sample.yml
ENV SETTINGS_FLAVOR oss
ENV OSS_HOST your_oss_host
ENV OSS_BUCKET your_oss_bucket
ENV OSS_KEY your_access_key_id
ENV OSS_SECRET your_access_key_secret

CMD exec docker-registry

FROM phusion/baseimage:0.9.16
MAINTAINER Rylee Fowler <rylee@rylee.me>

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 1935
EXPOSE 80

# create directories
RUN mkdir /src &&  \
	mkdir /config &&  \
	mkdir /logs &&  \
	mkdir /data &&  \
	mkdir /static

# update and upgrade packages
RUN apt-get -y update && apt-get upgrade -y && apt-get -y clean
RUN apt-get install -y build-essential wget

# ffmpeg
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get update
RUN apt-get install -y ffmpeg

# nginx dependencies
RUN apt-get install -y libpcre3-dev zlib1g-dev libssl-dev
RUN apt-get install -y wget

# get nginx source
RUN cd /src && \
	wget http://nginx.org/download/nginx-1.8.0.tar.gz && \
	tar zxf nginx-1.8.0.tar.gz && \
	rm nginx-1.8.0.tar.gz

# get nginx-rtmp module
RUN cd /src && \
	wget https://github.com/arut/nginx-rtmp-module/archive/v1.1.7.tar.gz && \
	tar zxf v1.1.7.tar.gz && \
	rm v1.1.7.tar.gz

# compile nginx
RUN cd /src/nginx-1.8.0 && \
	./configure --add-module=/src/nginx-rtmp-module-1.1.7 \
	--conf-path=/config/nginx.conf --error-log-path=/logs/error.log \
	--http-log-path=/logs/access.log

RUN cd /src/nginx-1.8.0 && make && make install

RUN mkdir /etc/service/nginx/
ADD scripts/nginx.sh /etc/service/nginx/run

ADD nginx.conf /config/nginx.conf
ADD static /static

CMD ["/sbin/my_init"]

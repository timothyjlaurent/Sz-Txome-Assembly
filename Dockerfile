FROM phusion/baseimage

MAINTAINER Timothy Laurent timothyjlaurent@gmail.com

RUN apt-get update;\
    apt-get install -y -q wget;\
    apt-get install -y -q openjdk-6-jre;\
    apt-get clean

RUN mkdir /trinity && cd /trinity;\
    wget http://sourceforge.net/projects/trinityrnaseq/files/trinityrnaseq_r20140413p1.tar.gz;\
    apt-get install -y -q build-essential; apt-get clean;\
    apt-get install -y -q zlib1g-dev && apt-get clean;\
    tar -xaf trinity*; rm -rf *.gz;\
    mv -r trinityrnaseq_r20140413p1/* ./;\
    rm -rf trinityrnaseq_r20140413p1;\
    make



RUN echo -n "/trinity" > /etc/containter_environment/PATH

VOLUME ["/data"]


ENTRYPOINT ["/sbin/my_init","--"]

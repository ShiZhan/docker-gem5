FROM phusion/baseimage:0.9.22
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>

# get dependencies
RUN apt-get update apt-get install -yq \
        build-essential git-core m4 scons \
        zlib1g zlib1g-dev \
        libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
        swig \
        python-dev python
RUN apt-get clean && rm -Rf /var/lib/apt/lists/*

# checkout repo with mercurial
WORKDIR /usr/local/src
RUN git clone https://github.com/gem5/gem5.git
# build it
WORKDIR /usr/local/src/gem5
ADD build.bash /usr/local/src/gem5/build.bash
RUN chmod ugo+x build.bash
RUN ./build.bash

CMD ["/sbin/init"]

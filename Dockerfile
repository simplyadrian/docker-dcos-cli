FROM alpine:latest
MAINTAINER Adrian Herrera <simplyadrian@gmail.com>

# set some environment variables
ENV DCOS_CONFIG=/dcos-cli/.dcos/dcos.toml
ENV DCOS_URL=https://dev-dcos-master.mgage.com
ENV DCOS_CLI_VERSION=0.4.4

# update and install alpine packages
RUN apk --update add \
    bash \
    curl \
    python \
    python-dev \
    py-pip \
    gcc \
    g++ \
    make \
    libffi-dev \
    openssl-dev

# install virtualenv python package
RUN pip install virtualenv==13.1.2

# install credstash
RUN pip install credstash==1.11.0

# create setup directory
RUN mkdir /dcos-cli
RUN mkdir /dcos-cli/.dcos

# copy dcos setup files into place
COPY config.sh /dcos-cli/config.sh
COPY setup.sh /dcos-cli/setup.sh
COPY credstash.sh /dcos-cli/credstash.sh
COPY dcos-cli.sh /dcos-cli/dcos-cli.sh

# install dcos command line tool
RUN /bin/bash /dcos-cli/setup.sh

ENTRYPOINT ["/dcos-cli/dcos-cli.sh"]

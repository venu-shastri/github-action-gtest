FROM alpine

LABEL "com.github.actions.name"="action-gtest"
LABEL "com.github.actions.description"="GitHub action with built gtest"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="black"

LABEL "repository"="https://github.com/CyberZHG/github-action-gtest.git"
LABEL "homepage"="https://github.com/CyberZHG/github-action-gtest"
LABEL "maintainer"="CyberZHG <CyberZHG@gmail.com>"

RUN apk add --no-cache -f bash g++ make cmake

RUN wget https://github.com/google/googletest/archive/master.zip
RUN unzip master.zip && \
    mv googletest-master /googletest && \
    mkdir -p /googletest/build && \
    cd /googletest/build && \
    cmake .. && \
    make && \
    make install && \
    cd /

RUN export GTEST_DIR="/googletest/googletest/" GTEST_LIB_DIR="/googletest/build/lib/"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

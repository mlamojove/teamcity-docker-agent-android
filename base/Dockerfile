FROM jetbrains/teamcity-agent:10.0.5

MAINTAINER Lukáš Nevařil & Martin Šindelář

ENV GRADLE_HOME=/usr/bin/gradle

## From appunite/docker on github <https://github.com/appunite/docker/blob/master/android-java7-8-r25/Dockerfile>

# Install Deps
# architecture download commented out for testing purpose
# RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y --force-yes expect git mc gradle unzip \
    wget curl libc6-i386 lib32stdc++6 lib32gcc1 \
    lib32ncurses5 lib32z1
RUN apt-get clean
RUN rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy install tools
COPY tools /opt/tools
ENV PATH ${PATH}:/opt/tools

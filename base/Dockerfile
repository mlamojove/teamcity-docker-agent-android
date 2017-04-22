FROM jetbrains/teamcity-agent:10.0.5

MAINTAINER Lukáš Nevařil & Martin Šindelář

RUN apt-get install -y mc
RUN apt-get install -y gradle
RUN apt-get install -y unzip

ENV GRADLE_HOME=/usr/bin/gradle

## From appunite/docker on github <https://github.com/appunite/docker/blob/master/android-java7-8-r25/Dockerfile>

# Install Deps
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl libqt5widgets5 && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy install tools
COPY tools /opt/tools
ENV PATH ${PATH}:/opt/tools

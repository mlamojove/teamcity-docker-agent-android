FROM jetbrains/teamcity-agent:10.0.5

MAINTAINER Lukáš Nevařil & Martin Šindelář

RUN apt-get install -y mc
RUN apt-get install -y gradle

ENV GRADLE_HOME=/usr/bin/gradle

## From appunite/docker on github <https://github.com/appunite/docker/blob/master/android-java7-8-r25/Dockerfile>

# Install Deps
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl libqt5widgets5 && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy install tools
COPY tools /opt/tools
ENV PATH ${PATH}:/opt/tools

RUN cd /opt && wget --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
  tar xzf android-sdk.tgz && \
  rm -f android-sdk.tgz && \
  chown -R root.root android-sdk-linux

RUN cd /opt && /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter sys-img-armeabi-v7a-android-25"

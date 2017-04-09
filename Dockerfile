FROM teamcity-docker-agent-android-base:0.1

MAINTAINER Martin Šindelář & Lukáš Nevařil

# Install Android SDK
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
  tar xzf android-sdk.tgz && \
  rm -f android-sdk.tgz && \
  chown -R root.root android-sdk-linux && \
  /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,tools,build-tools-25.0.0,android-25,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services"

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Cleaning
RUN apt-get clean

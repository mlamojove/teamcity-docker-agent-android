FROM teamcity-docker-agent-android-base:0.1

MAINTAINER Lukáš Nevařil & Martin Šindelář

RUN cd /opt && wget --output-document=android-tools.zip https://dl.google.com/android/repository/tools_r25.2.5-linux.zip && unzip android-tools.zip -d android-sdk-linux && chown -R root.root android-sdk-linux

RUN cd /opt && /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --no-ui --filter android-25"

RUN cd /opt && /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter sys-img-armeabi-v7a-google_apis-25"

# Install Android SDK
RUN cd /opt && /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,build-tools-25.0.0,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services"

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Create emulator
RUN echo "no" | android create avd --force --device "Nexus 5" --name emulator64 --abi google_apis/armeabi-v7a --target android-25 --skin WVGA800 --sdcard 512M

RUN mksdcard -l myCard 512M myCard.img

# Cleaning
RUN apt-get clean

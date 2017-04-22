FROM teamcity-docker-agent-android-base:0.1

MAINTAINER Martin Šindelář & Lukáš Nevařil

# Install Android SDK
RUN cd /opt && /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter platform-tools,tools,build-tools-25.0.0,android-25,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services"

# Setup environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN which adb
#RUN which android

# Create emulator
RUN echo "no" | android create avd \
                --force \
                --device "Nexus 5" \
                --name test \
                --target android-25 \
                --abi sys-img-armeabi-v7a-google_apis-25 \
                --skin WVGA800 \
                --sdcard 512M


# Cleaning
RUN apt-get clean

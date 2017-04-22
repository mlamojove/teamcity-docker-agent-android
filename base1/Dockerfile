FROM teamcity-docker-agent-android-base:0.1


RUN cd /opt && wget --output-document=android-tools.zip https://dl.google.com/android/repository/tools_r25.2.5-linux.zip && unzip android-tools.zip -d android-sdk-linux && chown -R root.root android-sdk-linux

#  tar xzf android-sdk.tgz && \
#  rm -f android-sdk.tgz && \

RUN cd /opt && /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --no-ui --filter android-25"

RUN cd /opt && /opt/tools/android-accept-licenses.sh "android-sdk-linux/tools/android update sdk --all --no-ui --filter sys-img-armeabi-v7a-google_apis-25"

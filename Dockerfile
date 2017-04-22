FROM teamcity-docker-agent-android-base2:0.1

# Create emulator
RUN echo "no" | android create avd --force --device "Nexus 5" --name final --abi google_apis/armeabi-v7a --target android-25 --skin WVGA800 --sdcard 512M

RUN emulator64-arm -avd final -no-skin -no-audio -no-window
RUN adb wait-for-device
RUN adb shell input keyevent 82

# Cleaning
RUN apt-get clean

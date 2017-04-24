FROM teamcity-docker-agent-android-base2:0.1

# Create emulator
RUN echo "no" | android create avd --force --device "Nexus 5" --name emulator64 --abi google_apis/armeabi-v7a --target android-25 --skin WVGA800 --sdcard 512M

RUN mksdcard -l myCard 512M myCard.img

# Cleaning
RUN apt-get clean

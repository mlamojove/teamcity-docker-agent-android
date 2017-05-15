# Build steps

### Gradle
Runner type: Gradle

Gradle tasks: clean build connectedAndroidTest assemble


### Running Emulator
Runner type: Command Line

Custom Script:
```
#!/bin/bash
emulator64-arm -avd emulator64 -no-skin -no-audio -no-window -verbose -sdcard myCard.img &
adb wait-for-device

A=$(adb shell getprop sys.boot_completed | tr -d '\r')

while [ "$A" != "1" ]; do
        echo Checking emulator status ...
        sleep 20
        A=$(adb shell getprop sys.boot_completed | tr -d '\r')
done

adb shell input keyevent 82
```
### Terminate adb server
Runner type: Command Line

Custom Script:
```
#!/bin/bash
adb kill-server
```

# Build features
### XML report processing
Report type: Ant JUnit

Monitoring rules:
```
app/build/outputs/androidTest-results/connected/*.xml
app/build/test-results/**/*.xml
```
# General settings
### Artifacts export
Artifact paths: `+:**/*.apk`

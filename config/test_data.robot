# Please copy this file to config folder (outside sample folder). This should be the only file touched when changing environments
*** Variables ***
${APK_PATH}               /Users/ashish.sharma6/Desktop/Build
${APK_TARGET}             ${APK_PATH}/alaska-integration-debug.apk
${OLD_APK_PATH}           /users/ashish.sharma6/Desktop/PreviousBuild
${OLD_APK_TARGET}         ${OLD_APK_PATH}/previous_build.apk
${BBM_PACKAGE}            com.bbm
${BBM_ACTIVITY}           com.bbm.ui.activities.MainActivity
${APPIUM_PORT}            4723
${APPIUM_SERVER}          http://127.0.0.1:${APPIUM_PORT}/wd/hub
${CHROMEDRIVER}           /usr/local/bin/chromedriver
${BOOTSTRAP_PORT}         50000
${PLATFORM}               Android
#${UDID}                           517c6a0d
${UDID}                   192.168.56.101:5555
${ALIAS}                  Android
${NO_RESET}               true
${EMAIL}                  ashish.sharma6@globallogic.com
${PASSWORD}               Test@1234

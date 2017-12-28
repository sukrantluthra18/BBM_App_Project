# This would serve as a global reference for all tests
# ex. All library and resources and application control keywords only
*** Settings ***
Library     AppiumLibrary            timeout=60    run_on_failure=Log Source
Library     Process
#Library     DebugLibrary
Library     Collections
Library     OperatingSystem

Resource    config/test_data.robot
Resource    pages/_PAGE_IMPORTS.robot
Resource    logic/_LOGIC_IMPORTS.robot

*** Keywords ***
Get Working Path
    Run Process                     pwd                             shell=True                                 alias=proc1
    ${WORKING_PATH}=                Get Process Result              proc1                                      stdout=true
    Set Suite Variable              ${WORKING_PATH}

Spawn Appium Server
    Get Working Path
    ${APPIUM_PROCESS}=              Start Process   appium -p ${APPIUM_PORT} -bp ${BOOTSTRAP_PORT} --chromedriver-executable ${CHROMEDRIVER}    stdout=${WORKING_PATH}/appium-log-${ALIAS}.txt    shell=true    alias=spawnAppium
    Process Should Be Running	      ${APPIUM_PROCESS}     error_message=Appium is not running.
    Set Suite Variable             ${APPIUM_PROCESS}
    Sleep   10

Close Appium Server
    Terminate All Processes         kill=True
    Run Keyword And Ignore Error    Process Should Be Stopped       ${APPIUM_PROCESS}     error_message=Appium is still running.
    Run Keyword And Ignore Error      Run Process     killall Appium       shell=yes

Teardown Steps
    Run Keyword If Test Failed      Log To Console          Failed :{
    Run Keyword If Test Passed      Run Keywords
    ...                             Log To Console          Success :D      AND
    ...                             Close All Applications

Get Current Activity
    ${ACTIVITY}=                    Get Activity
    Log To Console                  Accessing ${ACTIVITY}
    Set Global Variable             ${ACTIVITY}

Open BBM App
    ${status}                       ${value}=   Run Keyword And Ignore Error    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM}    udid=${UDID}    deviceName=${ALIAS}   app=${BBM_PACKAGE}    appActivity=${BBM_ACTIVITY}   alias=${ALIAS}    noReset=True     autoGrantPermissions=true
    Log To Console                  Open Apps is ${status}
    #Run Keyword If                  '${ACTIVITY}'!=''

Clear BBM Data
    Run Process                     adb -s ${UDID} shell pm clear ${BBM_PACKAGE}      shell=true      alias=proc1
    ${CLEAR_STATUS}=                Get Process Result     proc1     stdout=true
    Log To Console                  ${CLEAR_STATUS} Clear Data

Get BBM Version
    ${version}=                     Run Keyword And Ignore Error    Run Process   adb -s ${UDID} shell dumpsys package com.bbm | grep versionName         shell=true
    Log To Console                  ${version}                      shell=true

Get Current Source
    ${src}                                Get Source
    Create File                           ${OUTPUT_DIR}/source.html    ${src}

    # Reinstall BBM
    #     ${uninstall}=                   Run Keyword And Ignore Error    Run Process                                adb -s ${UDID} uninstall ${BBM_PACKAGE}                      shell=true
    #     Run Keyword And Ignore Error    Should Be Equal As Integers     ${uninstall.rc}                            0
    #     ${install}=                     Run Process                     adb -s ${UDID} install -g ${APK_TARGET}    shell=true                                                   cwd=${APK_PATH}
    #     Should Be Equal As Integers     ${install.rc}                   0

Reopen BBM
    Close Application
    Open BBM App
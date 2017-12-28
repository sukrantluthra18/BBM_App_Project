*** Setting ***
Resource          ../resource.robot
Resource          ../logic/BBID.robot
Suite Setup       Spawn Appium Server
Suite Teardown    Close Appium Server
Test Teardown     resource.Teardown Steps
Force Tags        Login

*** Test Case ***
Login to BBM
    [Documentation]           Will automate to BBM Login
    [Setup]                   Clear BBM Data
    Open BBM App
    Sleep   10
    BBID.Login with Valid Credential E-mail    ${EMAIL}     ${PASSWORD}

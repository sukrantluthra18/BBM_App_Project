*** Setting ***
Resource          ../resource.robot
Suite Setup       Spawn Appium Server
Suite Teardown    Close Appium Server
Test Teardown     Close Application
Force Tags        NEWS-ROW

*** Test Case ***
Open NEWS in Discover
    [Setup]                    Open BBM App
    FUNCTIONALITY.Wait Until BBM Open
    NEWS.Tap Discover Tab
    NEWS.Tap News
    NEWS.Verify News Opened
*** Setting ***
Resource          ../resource.robot
Suite Setup       Spawn Appium Server
Suite Teardown    Close Appium Server
Test Teardown     Close All Applications
Force Tags        UBER-ROW

*** Test Case ***
Open UBER in Discover
    [Setup]                             Open BBM App
    FUNCTIONALITY.Wait Until BBM Open
    Sleep      5
    UBER.Tap Discover Tab
    UBER.Tap Uber
    Sleep      5
    Uber.Verify Uber Opened
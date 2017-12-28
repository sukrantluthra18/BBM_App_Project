*** Setting ***
Resource          ../resource.robot
Suite Setup       Spawn Appium Server
Suite Teardown    Close Appium Server
Test Teardown     resource.Teardown Steps
Force Tags        FOOTBALL-ROW

*** Test Case ***
Open FOOTBALL365 in Discover
    [Setup]                                   Open BBM App
    FUNCTIONALITY.Wait Until BBM Open
    FOOTBALL_365.Tap Discover Tab
    FOOTBALL_365.Tap Football365
    FOOTBALL_365.Verify Football365 Opened
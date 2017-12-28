*** Setting ***
Resource                  ../resource.robot
Suite Setup               Spawn Appium Server
Suite Teardown            Close Appium Server
Test Teardown             Close All Applications
Force Tags                SportsNet-ROW

*** Test Case ***
Open SportsNet in Discover
  [Setup]                 Open BBM App

  FUNCTIONALITY.Wait Until BBM Open
  Sleep    1
  FUNCTIONALITY.Rate This App
  FUNCTIONALITY.Idle
  Sleep    5
  SPORTS_NET.Tap Discover Tab
  Sleep    5
  SPORTS_NET.Tap SportsNet
  Sleep    5
  SPORTS_NET.Verify SportsNet Opened
  

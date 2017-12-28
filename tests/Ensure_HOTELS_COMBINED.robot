*** Setting ***
Resource                  ../resource.robot
Suite Setup               Spawn Appium Server
Suite Teardown            Close Appium Server
Test Teardown             Close All Applications
Force Tags                HotelsCombined-ROW

*** Test Case ***
Open Hotels Combined in Discover
  [Setup]                 Open BBM App
  FUNCTIONALITY.Wait Until BBM Open
  Sleep         5
  HOTELS_COMBINED.Tap Discover Tab
  HOTELS_COMBINED.Tap HOTELS COMBINED
  Sleep          10
  HOTELS_COMBINED.Verify HOTELS COMBINED Opened

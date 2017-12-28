*** Settings ***
Resource                          FUNCTIONALITY.robot

*** Keyword ***
Tap Discover Tab
  FUNCTIONALITY.Navigate          Discover

Tap HotelsCombined
  Wait Until Page Contains        HotelsCombined    timeout=10     error=Hotel Combined menu in Discover Not Found. Probably GPS Error?
  Click Text                      HotelsCombined    exact_match=True

Verify HotelsCombined Opened
   FUNCTIONALITY.Switch to Webview Until Element           id=web_view_container
  Wait Until Element Is Visible   id=hc_f_where_1   timeout=10    error=ID Not found


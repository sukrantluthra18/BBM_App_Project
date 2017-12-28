*** Settings ***
Resource    FUNCTIONALITY.robot

*** Keyword ***
Tap Discover Tab
    FUNCTIONALITY.Navigate      Discover

Tap Uber
    Wait Until Page Contains    Uber     timeout=20           error=Uber menu in Discover Not Found. Probably GPS Error?
    Click Text                  Uber     exact_match=True

Verify Uber Opened
    FUNCTIONALITY.Switch to Webview Until Element       id=web_view_container
    Wait Until Page Contains Element    css=._t._cx._cy._cz
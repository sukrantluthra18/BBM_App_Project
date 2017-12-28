*** Settings ***
Resource    FUNCTIONALITY.robot

*** Keyword ***
Tap Discover Tab
    FUNCTIONALITY.Navigate           Discover

Tap News
    Wait Until Page Contains         News     timeout=20           error=News menu in Discover Not Found. Probably GPS Error?
    Click Text                       News     exact_match=True

Verify News Opened
    FUNCTIONALITY.Switch to Webview Until Element           id=web_view_container
    Wait Until Page Contains Element   css=.form-search-input.form-input    error=Timeout is 5sec and I can't find the search bar
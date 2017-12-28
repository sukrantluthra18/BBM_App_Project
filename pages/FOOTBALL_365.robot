*** Settings ***
Resource    FUNCTIONALITY.robot

*** Keyword ***
Tap Discover Tab
    Sleep                            5
    FUNCTIONALITY.Navigate           Discover

Tap Football365
    Wait Until Page Contains         Football365    timeout=20
    Click Text                       Football365    exact_match=True

Verify Football365 Opened
    FUNCTIONALITY.Switch to Webview Until Element     id=web_view_container
    Wait Until Page Contains Element    css=.container   error=Football365 couldn't be open
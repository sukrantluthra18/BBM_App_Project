*** Keyword ***
Wait Until BBM Open
    ${status1}  ${value}    Run Keyword And Ignore Error      Wait Until Element Is Visible     id=com.android.launcher3:id/launcher    timeout=5
    Run Keyword If  '${status1}' == 'PASS'    Reopen BBM
    ${status}  ${value}=   Run Keyword And Ignore Error    Verify Home Page
    ${status2}  ${value}=  Run Keyword And Ignore Error    Wait Until Element Is Visible     id=com.android.launcher3:id/launcher    timeout=3
    Run Keyword If  '${status}' == 'FAIL' and '${status2}'=='PASS'     Reopen BBM
    Run Keyword If  '${status}' == 'FAIL' and '${status2}'=='FAIL'     Run Keywords
    ...  BBID.Skip Find Friends  AND
    ...  BBID.Ignore Update BBM  AND
    ...  BBID.Ignore Personalize Your Profile  AND
    ...  BBID.Ignore Dim Screen  AND
    ...  Rate This App
    Run Keyword If      '${status}'=='PASS'   Log To Console    BBM Opened Sucessfully

Verify Home Page
    Wait Until Page Contains Element    id=main_toolbar  timeout=30

Navigate
    [Arguments]                      ${tab_name}
    Get Current Activity
    Run Keywords                     Should Be Equal   '${ACTIVITY}'    '.ui.activities.MainActivity'   AND
    ...                              Wait Until Element Is Visible      id=main_toolbar
    Wait Until Page Contains         ${tab_name}      error=Couldn't locate ${tab_name}                 timeout=30
    Click Text                       ${tab_name}                                                        exact_match=True

Open Menu
    [Arguments]                      ${trigger}
    Wait Until Page Contains         ${trigger}      timeout=5           error=${trigger} Menu Section Not Found
    Click Text                       ${trigger}      exact_match=True
    
Swipe Up
    [Arguments]                       ${locator}=xpath=//*
    ${size}                           Get Element Size        ${locator}
    ${location}                       Get Element Location    ${locator}
    ${start_x}=           Evaluate      ${location['x']} + (${size['width']} * 0.5)
    ${start_y}=           Evaluate      ${location['y']} + (${size['height']} * 0.7)
    ${end_x}=             Evaluate      ${location['x']} + (${size['width']} * 0.5)
    ${end_y}=             Evaluate      ${location['y']} + (${size['height']} * 0.3)
    Swipe                 ${start_x}    ${start_y}  ${end_x}  ${end_y}  1000
    Sleep  1

Scroll Down To Text
    [Documentation]  locator: text to find
    ...              max_scrolls: number of scroll attempts before failure (default 10)
    ...              scroll_area: specify a certain scroll view area by a locator. Otherwise uses screen size
    [Arguments]  ${locator}  ${max_scrolls}=10  ${scroll_area}=xpath=//*
    
    :FOR  ${count}  IN RANGE  0  ${max_scrolls}+1
    \  ${status}  ${value}  Run Keyword And Ignore Error  Page Should Contain Text  ${locator}
    \  Run Keyword If  '${status}' == 'PASS'  Exit For Loop
    \  Run Keyword If  ${count}==${max_scrolls}  Fail  msg=Did not find "${locator}" after scrolling down a max ${max_scrolls} times.
    \  Swipe Up  ${scroll_area}
    
Rate This App
    ${status}                       ${value} =      Run Keyword And Ignore Error      Wait Until Page Contains      Rate This App   timeout=3
    Run Keyword If                  '${status}'=='PASS'    Click Text      No Thanks
  
   
List Contexts
    ${contexts}=                    Get Contexts
    ${native}=                      Get From List           ${contexts}           0
    ${webview}=                     Get From List           ${contexts}           1
    ${webview2}=                    Get From List           ${contexts}           2
    Set Test Variable               ${native}
    Set Test Variable               ${webview}
    
Switch to Native Until Element
    [Arguments]                     ${locator}
    Wait Until Page Contains Element   ${locator}    timeout=20
    List Contexts
    Switch To Context               ${native}

Switch to Native
    List Contexts
    Switch To Context               ${native}
    
Switch to Webview Until Element
    [Arguments]                     ${locator}
    Wait Until Page Contains Element   ${locator}    timeout=20     error=Couldn't Locate ${locator}
    List Contexts
    Switch To Context               ${webview}
    
Switch to Webview
    List Contexts
    Switch To Context               ${webview}
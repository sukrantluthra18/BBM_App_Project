*** Keywords ***
Wait Until Welcome To BBM Displayed
    ${status}           ${value}=   Run Keyword And Ignore Error    Wait Until Page Contains      Welcome to BBM        timeout=120       error=Couldn't locate Welcome to BBM Page
    Run Keyword If      '${status}'!='PASS'     Fail    Fail to locate Login Screen
    Log To Console      Locate Welcome Page is ${status}   console=yes

Tap Sign In Button
    Wait Until Page Contains Element    id=formId:signinPhone      timeout=20
    Click Element                       id=formId:signinPhone

Wait Until Welcome Back Displayed
    Wait Until Page Contains            Welcome Back     error=Couldn't locate Welcome Back Page (too slow maybe)     timeout=60

Tap Sign In With Email
    ${status}                           ${value} =  Run Keyword And Ignore Error      Click Element     xpath=//android.widget.EditText[@content-desc="Email Address"]

Send E-mail BBM
    [Arguments]                         ${email}
    Wait Until Page Contains Element    id=formId:email      timeout=30
    Input Text                          id=formId:email      ${email}

Send PASSWORD BBM
    [Arguments]                         ${password}
    Wait Until Page Contains Element    id=formId:password
    Input Password                      id=formId:password        ${password}

Tap Sign In
    Wait Until Page Contains Element    id=formId:logincommandLink
    Click Element                       id=formId:logincommandLink

Switch BBM Account
    Wait Until Page Contains Element    id=alertTitle       timeout=45
    Click Element                       id=button1
# Skip Secure BBM Page Displayed
#     ${status}                           ${value} =  Run Keyword And Ignore Error    Wait Until Page Contains Element      xpath=//android.view.View[@content-desc="Secure BBM by adding your phone number."]      timeout=30      error=Not Found Secure BBM
#     Log To Console                      ${status} to find Secure BBM Page
#     Run Keyword If                      '${status}'=='PASS'     Click Element       xpath=//android.view.View[@content-desc="Skip"]

Skip Find Friends
    Wait Until Page Contains            Find Friends      timeout=20
    ${status}                           ${value} =  Run Keyword And Ignore Error      Wait Until Page Contains Element    id=message    timeout=20
    Run Keyword If                      '${status}'=='PASS'    Click Element                       id=button2
    Run Keyword If                      '${status}'=='PASS'    Wait Until Page Contains Element    id=title_template
    Run Keyword If                      '${status}'=='PASS'    Click Element                       id=button1
    Run Keyword If                      '${status}'=='PASS'    Log To Console                      Success Skip Friends

Ignore Update BBM
    Wait Until Page Contains Element    id=alertTitle    error=Title Not Found
    Click Element                       id=button2
    Log To Console                      Success Ignore Update BBM

Ignore Personalize Your Profile
    ${status}                           ${value} =  Run Keyword And Ignore Error      Wait Until Page Contains Element    id=set_avatar_info
    Run Keyword If                      '${status}'=='PASS'    Go Back
    Log To Console                      Success Ignore Personalize Your Profile        console=yes

Ignore Dim Screen
    Wait Until Page Contains            There are Contacts and then there are BBM Contacts.      error=Couldn't Locate There are Contacts...   timeout=20
    Click Text                          There are Contacts and then there are BBM Contacts.
    Log To Console                      Success Ignore Dim Screen\nSleeping Now

Privacy Consent
   Wait Until Page Contains Element    id=alertTitle       timeout=45
   Click Element                       id=button1

Iddling
    Sleep                               20
    FUNCTIONALITY.Navigate              Chats
    FUNCTIONALITY.Navigate              Contacts
    FUNCTIONALITY.Navigate              Feeds
    FUNCTIONALITY.Navigate              Contacts
    Sleep                               3
    FUNCTIONALITY.Navigate              Discover
    ${status}                           ${value}=   Run Keyword And Ignore Error    Wait Until Page Contains            News      timeout=5
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Contacts
    Run Keyword If                      '${status}'!='PASS'       Sleep                               3
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Discover
    Run Keyword If                      '${status}'!='PASS'       Sleep                               3
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Contacts
    Run Keyword If                      '${status}'!='PASS'       Sleep                               3
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Discover
    ${status}                           ${value}=   Run Keyword And Ignore Error    Wait Until Page Contains            News      timeout=5
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Contacts
    Run Keyword If                      '${status}'!='PASS'       Sleep                               3
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Discover
    Run Keyword If                      '${status}'!='PASS'       Sleep                               3
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Contacts
    Run Keyword If                      '${status}'!='PASS'       Sleep                               3
    Run Keyword If                      '${status}'!='PASS'       FUNCTIONALITY.Navigate              Discover
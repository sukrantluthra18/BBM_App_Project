*** Settings ***
Resource              ../pages/_PAGE_IMPORTS.robot

*** Keyword ***
Login with Valid Credential E-mail
    [Arguments]   ${username}  ${password}
    BBID.Wait Until Welcome To BBM Displayed
    BBID.Tap Sign In Button
    BBID.Wait Until Welcome Back Displayed
    BBID.Tap Sign In With Email
    BBID.Send E-mail BBM  ${email}
    BBID.Send PASSWORD BBM  ${password}
    BBID.Tap Sign In
    BBID.Switch BBM Account
    BBID.Skip Find Friends
    ##BBID.Skip Secure BBM Page Displayed
    BBID.Privacy Consent
    BBID.Ignore Personalize Your Profile
    BBID.Ignore Dim Screen
    BBID.Iddling
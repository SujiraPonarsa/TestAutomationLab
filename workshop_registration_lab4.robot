*** Settings ***
Library         SeleniumLibrary
Suite Setup     Set Selenium Speed    0.5 seconds

*** Variables ***
${URL}           http://localhost:7272/Lab4/Registration.html
${BROWSER}       Chrome

*** Test Cases ***
TC001: Open Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Workshop Registration
    [Teardown]    Close Browser

TC002: Register Success
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=firstname       Somyod
    Input Text    id=lastname        Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email           somyod@kkumail.com
    Input Text    id=phone           091-001-1234
    Click Element    id=registerButton
    Wait Until Location Contains    Success.html    timeout=10s
    Page Should Contain             Thank you for registering with us.
    [Teardown]    Close Browser

TC003: Success No Org
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=firstname       Somyod
    Input Text    id=lastname        Sodsai
    Input Text    id=email           somyod@kkumail.com
    Input Text    id=phone           091-001-1234
    Click Element    id=registerButton
    Wait Until Location Contains    Success.html    timeout=10s
    Page Should Contain             Thank you for registering with us.
    [Teardown]    Close Browser
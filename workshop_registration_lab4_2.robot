*** Settings ***
Library         SeleniumLibrary
Suite Setup     Setup Browser
Suite Teardown  Close Browser
Test Setup      Go To    ${URL}

*** Variables ***
${URL}          http://localhost:7272/Lab4/Registration.html
${BROWSER}      Chrome

*** Keywords ***
Setup Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5 seconds

Verify Error
    [Arguments]    ${msg}
    Wait Until Element Contains    id=errors    ${msg}    timeout=5s

*** Test Cases ***
TC001: Empty First Name
    Input Text    id=lastname        Sodsai
    Input Text    id=email           somyod@kkumail.com
    Input Text    id=phone           091-001-1234
    Click Element    id=registerButton
    Verify Error    *Please enter your first name!!

TC002: Empty Last Name
    Input Text    id=firstname       Somyod
    Input Text    id=email           somyod@kkumail.com
    Input Text    id=phone           091-001-1234
    Click Element    id=registerButton
    Verify Error    *Please enter your last name!!

TC003: Empty Name
    Input Text    id=email           somyod@kkumail.com
    Input Text    id=phone           091-001-1234
    Click Element    id=registerButton
    Verify Error    *Please enter your name!!

TC004: Empty Email
    Input Text    id=firstname       Somyod
    Input Text    id=lastname        Sodsai
    Input Text    id=phone           091-001-1234
    Click Element    id=registerButton
    Verify Error    *Please enter your email!!

TC005: Empty Phone
    Input Text    id=firstname       Somyod
    Input Text    id=lastname        Sodsai
    Input Text    id=email           somyod@kkumail.com
    Click Element    id=registerButton
    Verify Error    *Please enter your phone number!!

TC006: Invalid Phone Number
    Input Text    id=firstname       Somyod
    Input Text    id=lastname        Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email           somyod@kkumail.com
    Input Text    id=phone           1234
    Click Element    id=registerButton
    Verify Error    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
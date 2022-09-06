*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${SWITCHLANGUAGEBUTTON}   xpath=//span[text()='Polski']

*** Test Cases ***
Switch language
   Open login page
   Type in email
   Type in password
   Click on the submit button
   Click on the switch language button
   Assert change
   [Teardown]  Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}        Test-1234
Click on the submit button
    Click Element       xpath=//*[(text()='Sign in')]
Click on the switch language button
    Wait Until Element Is Visible       ${SWITCHLANGUAGEBUTTON}
    Click Element       xpath=//span[text()='Polski']
Assert change
    Capture Page Screenshot     alert.png
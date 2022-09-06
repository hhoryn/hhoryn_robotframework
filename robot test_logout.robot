*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${SIGNOUTBUTTON}    xpath=//span[text()='Sign out']

*** Test Cases ***
Log out of the system
   Open login page
   Type in email
   Type in password
   Click on the submit button
   Click on the sign out button
   Assert title of the page
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
Click on the sign out button
    Wait Until Element Is Visible       ${SIGNOUTBUTTON}
    Click Element       xpath=//span[text()='Sign out']
Assert title of the page
    title should be     Scouts panel - sign in
    Capture Page Screenshot     switchlanguage.png
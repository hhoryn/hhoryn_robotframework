*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${ADDPLAYERBUTTON}  xpath=//*[text()='Add player']//parent::button
${NAMEINPUT}        xpath=//input[@name='name' and @type='text']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${AGEINPUT}         xpath=//input[@name='age']
${POSITIONINPUT}    xpath=//input[@name='mainPosition']
${SUBMITBUTTON}     xpath=//button[@type='submit']

*** Test Cases ***
Add player
   Open login page
   Type in email
   Type in password
   Click on the sign in button
   Click on the add player button
   Type in name
   Type in surname
   Select age
   Type in main position
   Click on the submit button
   [Teardown]  Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}        Test-1234
Click on the sign in button
    Click Element       xpath=//*[(text()='Sign in')]
Click on the add player button
    Wait Until Element Is Visible       ${ADDPLAYERBUTTON}
    Click Element       xpath=//span[text()='Add player']//parent::button
Type in name
    Wait Until Element Is Visible       ${NAMEINPUT}
    Input Text      ${NAMEINPUT}        Halyna
Type in surname
    Input Text      ${SURNAMEINPUT}     Horyn
Select age
    Input Text      ${AGEINPUT}     19041999
Type in main position
    Input Text      ${POSITIONINPUT}        goalkeeper
Click on the submit button
    Click Element       xpath=//button[@type='submit']


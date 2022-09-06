*** Settings ***
Library  SeleniumLibrary
Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${PLAYERSBUTTON}    xpath=//span[text()='Players']
${SEARCHBARXPATH}   xpath=//input[@aria-label='search']
${PLAYERXPATH}      xpath=//div[text()='H']
${REPORTSBUTTON}    xpath=//span[text()='Reports']
${ADDREPORTBUTON}   xpath=//*[text()='Add report']
${CREATEREPORTBUTTON}   xpath=//button[@title='Create report']
${SUBMITBUTTON}     xpath=//button[@type='submit']

*** Test Cases ***
Add report
   Open login page
   Type in email
   Type in password
   Click on the sign in button
   Click on the players button
   Click on the search button
   Type in player
   Click on the player
   Click on the reports button
   Click on the add report button
   Click on the create report button
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
Click on the players button
    Wait Until Element Is Visible       ${PLAYERSBUTTON}
    Click Element       xpath=//span[text()='Players']
Click on the search button
    Wait Until Element Is Visible       ${SEARCHBARXPATH}
    Click Element       xpath=//input[@aria-label='search']
Type in player
    Input Text      ${SEARCHBARXPATH}       Horyn
    Press Keys      ${SEARCHBARXPATH}       ENTER
Click on the player
    Wait Until Element Is Visible       ${PLAYERXPATH}
    Click Element       xpath=//div[text()='H']
Click on the reports button
    Click Element       xpath=//span[text()='Reports']
Click on the add report button
    Wait Until Element Is Visible       ${ADDREPORTBUTON}
    Click Element       xpath=//*[text()='Add report']
Click on the create report button
    Wait Until Element Is Visible       ${CREATEREPORTBUTTON}
    Click Element       xpath=//button[@title='Create report']
Click on the submit button
    Wait Until Element Is Visible       ${SUBMITBUTTON}
    Click Element       xpath=//button[@type='submit']

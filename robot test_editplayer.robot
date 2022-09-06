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
${SEARCHBARXPATH}   xpath=// input[@aria-label='search']
${PLAYERXPATH}      xpath=//div[text()='H']
${LEGDROPDOWNXPATH}  xpath=//div[@id='mui-component-select-leg']
${LEGXPATH}         xpath=//li[@data-value='right']
${SUBMITBUTTON}     xpath=//button[@type='submit']

*** Test Cases ***
Edit player
   Open login page
   Type in email
   Type in password
   Click on the sign in button
   Click on the players button
   Click on the search button
   Type in player
   Click on the player
   Click on the leg field
   Click on the right leg
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
Click on the leg field
    Click Element       xpath=//div[@id='mui-component-select-leg']
Click on the right leg
    Click Element       xpath=//li[@data-value='right']
Click on the submit button
    Click Element       xpath=//button[@type='submit']

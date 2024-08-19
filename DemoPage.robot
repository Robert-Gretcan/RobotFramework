*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://seleniumbase.io/demo_page
${INPUT_FIELD}    id=myTextInput
${DROPDOWN_BTN}   css=.dropdown .dropbtn
${DROPDOWN_ITEMS}  css=.dropdown-content a
${SELECT_FIELD}   xpath=//*[@id="mySelect"]
${IFRAME}         id=myFrame2
${IFRAME_H4}      tag=h4

*** Keywords ***
Open Demo Page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Fill Text Input
    Input Text    ${INPUT_FIELD}    This is a test 

Hover Over Dropdown And Check Items
    Mouse Over    ${DROPDOWN_BTN}
    Wait Until Element Is Visible    ${DROPDOWN_ITEMS}    5 seconds
    ${count}=    Get Element Count    ${DROPDOWN_ITEMS}
    Should be True  ${count}==3
   
Select From Dropdown with Options
    [Arguments]     @{options}
    FOR    ${option}    IN    @{options}
        Select From List By Label    ${SELECT_FIELD}    ${option}
        List Selection Should Be    ${SELECT_FIELD}    ${option}
        Log    Selected: ${option}
    END

Get Text From Iframe
    Select Frame    ${IFRAME}
    Element Should Contain    ${IFRAME_H4}    iFrame Text
    ${text}=    Get Text    ${IFRAME_H4}
    Log    H4 text inside iframe: ${text}
    Unselect Frame
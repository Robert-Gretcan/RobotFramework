*** Settings ***
Resource    DemoPage.robot
Library     SeleniumLibrary

*** Test Cases ***
Demo Page Test
    [Setup]    Open Demo Page

    ${options}=  Create List  Set to 50%  Set to 75%  Set to 100%

    Fill Text Input
    Hover Over Dropdown And Check Items
    Select From Dropdown with Options  @{options}
    Get Text From Iframe

    [Teardown]    Close Browser
*** Settings ***
Documentation       Ações da funcionaliade de busca de restaurantes
Library   Browser    strict=False

*** Variables ***
${DIV_BOX_RESTAURANT}     css=div[class="place-info-box"][style="opacity: 1;"]


*** Keywords ***
Go To Restaurants
    Click                      text=Estou com fome!
    Get Text                   css=h1 strong     contains    Ta na hora de matar a fome!

Serch By
    [Arguments]    ${value}
    Click          css=.search-link
    Fill Text      css=input[formcontrolname="searchControl"]    ${value}        

Restaurant for element visible
    [Arguments]                ${name}
    Wait For Elements State    ${DIV_BOX_RESTAURANT}    visible        timeout=10s
    Get Text                   ${DIV_BOX_RESTAURANT}    contains       ${name}
Restaurant count Should be
    [Arguments]                ${count}
    Wait For Elements State    ${DIV_BOX_RESTAURANT}    visible         10
    Get Element Count          ${DIV_BOX_RESTAURANT}    equal           ${count}
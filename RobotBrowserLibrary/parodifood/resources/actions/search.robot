*** Settings ***
Documentation       Ações da funcionaliade de busca de restaurantes

Library   Browser    strict=False

*** Variables ***
${DIV_BOX_RESTAURANT}     css=div[class="place-info-box"][style="opacity: 1;"]
${A_BOX_RESTAURANT}       xpath=//div[@class="col-sm-6 col-xs-12"]//a

*** Keywords ***
Go To Restaurants
    Click                      text=Estou com fome!
    Get Text                   css=h1 strong     contains    Ta na hora de matar a fome!

Choose Restaurant
    [Arguments]       ${super_var}
    Click             text=${super_var["restaurants"]}
    
    Wait For Elements State     css=#detail     visible    ${DEFAULT_TIMEOUT}
    Get Text                    css=#detail     contains   ${super_var["description"]}
Serch By
    [Arguments]    ${value}
    Click          css=.search-link
    Fill Text      css=input[formcontrolname="searchControl"]    ${value}        

Restaurant for element visible
    [Arguments]                ${name}
    Wait For Elements State    ${DIV_BOX_RESTAURANT}    visible        ${DEFAULT_TIMEOUT}
    Get Text                   ${DIV_BOX_RESTAURANT}    contains       ${name}
Restaurant count Should be
    [Arguments]                ${count}
    #Wait For Elements State    ${DIV_BOX_RESTAURANT}    visible      ${DEFAULT_TIMEOUT} 
    Get Element Count          ${DIV_BOX_RESTAURANT}    equal        ${count}
    #Wait For Elements State
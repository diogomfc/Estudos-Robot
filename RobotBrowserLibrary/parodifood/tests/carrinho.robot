*** Settings ***

Resource     ../resources/base.robot
#Resource      ${EXECDIR}/resources/base.robot

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Keywords ***
Choose Restaurant
    [Arguments]       ${restautant}
    Click             text=${restautant["name"]}
    Wait For Elements State     css=#detail     visible    10
    Get Text                    css=#detail     contains   ${restautant["description"]}
Add To Cart 
    [Arguments]       ${nameProduto}
    Click             xpath=//span[text()="${nameProduto}"]/..//a[@class="add-to-cart"]

Should Add To Cart
    [Arguments]       ${nameProduto}
    Wait For Elements State     css=#cart tr >> text=${nameProduto}    visible      5

Total Cart Should be
    [Arguments]       ${total}
    Get Text          xpath=//th[contains(text(),"Total")]/../td     contains   ${total}

*** Test Cases ***
Deve adicionar um item ao carrinho
    #${nome}        Set Variable    STARBUGS COFFEE 
    #${descricao}   Set Variable    Nada melhor que um café pra te ajudar a resolver um bug
    ${restautant}  Create Dictionary     
    ...    name=STARBUGS COFFEE     description=Nada melhor que um café pra te ajudar a resolver um bug

    Go To Restaurants
    Choose Restaurant      ${restautant}
    Add To Cart            Starbugs 500 error
    Should Add To Cart     Starbugs 500 error 
    Total Cart Should be   15,60
     
    Sleep    10
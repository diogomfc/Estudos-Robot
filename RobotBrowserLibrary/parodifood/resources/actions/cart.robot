*** Settings ***
Documentation      Ações para adicionar itens ao carrinho

Library   Browser    strict=False

*** Keywords ***

Add To Cart 
    [Arguments]       ${nameProduto}
    Click             xpath=//span[text()="${nameProduto}"]/..//a[@class="add-to-cart"]

Should Add To Cart
    [Arguments]       ${nameProduto}
    Wait For Elements State     css=#cart tr >> text=${nameProduto}    visible      ${DEFAULT_TIMEOUT}

Total Cart Should be
    [Arguments]       ${total}
    log               Total do carrinho: ${total}
    Get Text          xpath=//th[contains(text(),"Total")]/../td     contains   ${total}

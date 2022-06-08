*** Settings ***
library     Browser

Resource     ../resources/base.robot
#Resource      ${EXECDIR}/resources/base.robot

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve buscar um único restaurante
    Go To Restaurants
    Serch By                          Debuger
    Restaurant for element visible    DEBUGER KING
    Restaurant count Should be        1
    #Sleep          2s
    #Take Screenshot

Deve buscar por categoria
    Go To Restaurants
    Serch By                          cafe
    Restaurant for element visible    STARBUGS COFFEE


Deve buscar todos restaurantes
    Go To Restaurants
    Serch By                          a
    Restaurant count Should be        5
    #Wait For Elements State           css=.place-info-box    visible    timeout=10s
    #Wait For Elements State    css=div[class="place-info-box"][style="opacity: 1;"]   visible    timeout=10s
    #Sleep          2s

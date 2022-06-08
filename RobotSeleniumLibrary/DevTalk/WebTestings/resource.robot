*** Settings ***
Library     SeleniumLibrary
#Library   Browser

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com/index.php


*** Keywords ***
Acessar a pagina home do site da loja de produtos.
    Open Browser    browser=${BROWSER}    url=${URL}

Digitar o produto "${PRODUTOS}" no campo de pesquisa.
    Input Text    id=search_query_top    ${PRODUTOS}

Clicar no botão de pesquisar.
    Click Button    name=submit_search

Validar que o produto "${PRODUTOS}" pesquisado foi encontrado.
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
    #Element Text Should Be   //*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img    
    #Close Browser

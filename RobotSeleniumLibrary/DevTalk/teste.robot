*** Settings ***
Documentation       Suite de exemplo de robot


*** Variables ***
${MENSAGEM}     Hello Word!!
${numero1}      3
${numero2}      3


*** Test Cases ***
Cenário de teste 01: Olá mundo!
    Imprimir mensagem no console

cenário de teste 02: Soma de dois números
    verificar se 3+3 é 9


*** Keywords ***
Imprimir mensagem no console
    log To console    ${MENSAGEM}

verificar se 3+3 é 9
    Should Be True    9 == 9

abrir

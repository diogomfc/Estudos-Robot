*** Settings ***
Documentation    Acões da funcionaliade  de fechamento de pedido

Library   Browser    strict=False

*** Keywords ***
Go Checkout  #Vá para o checkout
    Click     text=Fechar Pedido

    ${element}     set variable     css=.page-header

    Wait For Elements State     ${element}       visible     ${DEFAULT_TIMEOUT}
    Get Text                    ${element}       contains    Finalize o seu pedido

Fill Data Customer   #Preenche os dados do cliente
    [Arguments]     ${customer}
    
    Fill Text       css=input[placeholder="Nome"]           ${customer["name"]}
    Fill Text       css=input[placeholder="E-mail"]         ${customer["email"]}
    Fill Text       css=input[placeholder^="Confirmação"]   ${customer["email"]}
    Fill Text       css=input[placeholder="Endereço"]       ${customer["address"]}
    Fill Text       css=input[placeholder="Número"]         ${customer["number"]}

Select Payment Option
    [Arguments]     ${payment}

    IF  "${payment}" == "Dinheiro"
      Click    xpath=(//mt-radio//label)[1]//div
    ELSE IF  "${payment}" == "Cartão de Débito"
      Click    xpath=(//mt-radio//label)[2]//div
    ELSE IF  "${payment}" == "Cartão Refeição"
      Click    xpath=(//mt-radio//label)[3]//div
    ELSE
       Fail  "Não foi possível selecionar a opção de pagamento"
    END

Pay Order  #Click em concluir Pedido
    Click     text= Concluir Pedido
Order Should Be Completed
    Wait For Elements State
...    css=p >> text=Seu pedido foi recebido pelo restaurante.     visible     ${DEFAULT_TIMEOUT}


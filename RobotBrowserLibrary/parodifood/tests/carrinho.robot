*** Settings ***

#Resource     ../resources/base.robot
Resource      ${EXECDIR}/resources/base.robot

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve adicionar um item ao carrinho
    #${nome}        Set Variable    STARBUGS COFFEE 
    #${descricao}   Set Variable    Nada melhor que um café pra te ajudar a resolver um bug

    ${restaurant}  Create Dictionary     
    ...    restaurants=STARBUGS COFFEE     description=Nada melhor que um café pra te ajudar a resolver um bug
     
    #${cart_json}         Get JSON       cart.json
    
    Go To Restaurants
    Choose Restaurant      ${restaurant}
    Add To Cart            Starbugs 500 error
    Should Add To Cart     Starbugs 500 error 
    Total Cart Should be   15,60

Deve adicionar 3 itens ao carrinho
    [tags]     temp    # robot -d ./results -i temp tests/carrinho.robot >> Vai executar somente esse senario
    
    #   ${restautant}  Create Dictionary     
    # ...    name=STARBUGS COFFEE     description=Nada melhor que um café pra te ajudar a resolver um bug

    ${cart_json}         Get JSON       cart.json

    Go To Restaurants
    Choose Restaurant      ${cart_json}
    
    #LOOP NO ARQUIVO CART.JSON 
    FOR  ${product}  IN  @{cart_json["products"]}
        # Add To Cart            ${cart_json["products"]["name"]}
        Add To Cart            ${product["name"]}
        Should Add To Cart     ${product["name"]}
    END

    # Add To Cart            Cappuccino com Chantilly
    # Should Add To Cart     Cappuccino com Chantilly 

    # Add To Cart            Super Espreso
    # Should Add To Cart     Super Espreso 

    # Add To Cart            Starbugs 500 error
    # Should Add To Cart     Starbugs 500 error 

    Total Cart Should be   ${cart_json["total"]}

    Sleep              10
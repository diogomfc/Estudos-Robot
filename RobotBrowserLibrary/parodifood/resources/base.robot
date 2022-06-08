*** Settings ***
Documentation     Arquivo base do projeto
Library   Browser    strict=False

Resource   ./actions/search.robot

*** Keywords ***
Start Session
    New Browser    chromium   false
    New Page       https://parodifood.herokuapp.com/
    
    #Chekpoint
    Get Text        css=span[style="font-size: 50px; font-weight: bold;"]  *=  Nunca foi tão engraçado pedir comida


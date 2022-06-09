*** Settings ***
Documentation     Arquivo base do projeto

Library   Browser    strict=False
Library   OperatingSystem     

Resource   ./actions/search.robot
Resource   ./actions/cart.robot
Resource   ./actions/order.robot

*** Variables ***
${DEFAULT_TIMEOUT}      10

*** Keywords ***
Start Session
    New Browser    chromium   false
    #New Browser    ${browser}   ${headless}     #robot -d ./results -v browser:firefox -v headless:false tests
    New Page       https://parodifood.herokuapp.com/  #http://parodifood.qaninja.academy/

    #Set ViewportSize    ${width}x${height}
    Set ViewportSize    1920   1080         #Resolução do monitor minimo para rodar o teste
    
    #Chekpoint
    Get Text        css=span[style="font-size: 50px; font-weight: bold;"]  *=  Nunca foi tão engraçado pedir comida

### Helpers ###
Get JSON
    [Arguments]       ${file_name}
    ${file}           Get File              ${EXECDIR}/resources/fixtures/${file_name}
    ${super_var}      Evaluate              json.loads($file)   json
    [return]          ${super_var}

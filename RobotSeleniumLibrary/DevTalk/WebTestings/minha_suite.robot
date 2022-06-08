*** Settings ***
Documentation       Suíte exemplo WebTestings

Resource            resource.robot


*** Test Cases ***
Caso de Teste 01: Pesquisar um produto no site.
    Acessar a pagina home do site da loja de produtos.
    Digitar o produto "blouse" no campo de pesquisa.
    Clicar no botão de pesquisar.
    Validar que o produto "blouse" pesquisado foi encontrado.
Fechar Navegador
    Close Browser
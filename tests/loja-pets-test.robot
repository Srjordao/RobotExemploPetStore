*** Settings ***
Resource    ${EXECDIR}/config/base.robot
Resource    ../services/api-Pets/loja-pets-service.robot
Library     Collections
Library     FakerLibrary
Library     String


#Funcionalidade: Cadastro, consulta, alteração e exclusão de clientes.
#                Cadastro e exclusão de serviços.
//Teste de conexão 5

#Eu como PO.
#Quero cadastrar,consultar,alterar e excluir clientes. 
#Para poder validar as funcionalidades do sistema.

*** Test Cases ***

#Dado que eu queira cadastrar um cliente 
#Quando realizar o POST no endpoint create 
#Então devo visulizar que foram criados os cadastros dos clientes.
Validar criação do cliente 
    [Tags]  criarCliente
    Conectar API
    Criar cliente
    Criar cliente
    Criar cliente

#Dado que eu queira consultar os dados de um cliente
#Quando realizar o GET no endpoint create 
#Então devo visulizar as informações.
Consultar cliente
    [Tags]  consultarCliente
    Conectar API
    Consultar cliente

#Dado que eu queira alterar o cadastro de um cliente 
#Quando realizar o PUT no endpoint create 
#Então devo visulizar que foram alterados as informações nos cadastros dos clientes.
Alterar cliente
    [Tags]  alterarCliente
    Conectar API
    Alterar cliente 1
    Alterar cliente 2
    Alterar cliente 3

#Dado que eu queira deletar o cadastro de um cliente 
#Quando realizar o DELETE no endpoint create 
#Então devo visulizar que os dados foram excluidos.
Deletar cliente
    [Tags]  deletarCliente
    Conectar API
    Deletar Cliente
    Deletar Cliente
    Deletar Cliente

#Dado que eu queira cadastrar um serviço 
#Quando realizar o POST no endpoint create 
#Então devo visulizar que foram criados os serviços.
Cadastrar Serviço
    [Tags]  cadastrarServicos
    Conectar API Cadastro Servicos
    Cadastrar Banho
    Cadastrar Tosa
    Cadastrar Banho e Tosa

#Dado que eu queira deletar um serviço 
#Quando realizar o DELETE no endpoint create 
#Então devo visulizar que foram deletados os serviços cadastrados.
Deletar Serviço
    [Tags]  deletarServicos
    Conectar API Cadastro Servicos
    Deletar Servico
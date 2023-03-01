*** Settings ***
Resource    ${EXECDIR}/config/base.robot
Resource    ../services/api-Pets/loja-pets-service.robot
Library     Collections
Library     FakerLibrary
Library     String


//Funcionalidade: Cadastro, consulta, alteração e exclusão de clientes. 


*** Test Cases ***
Validar criação do cliente 
    [Tags]  criarCliente
    Conectar API
    Criar cliente
    Criar cliente
    Criar cliente
Consultar cliente
    [Tags]  consultarCliente
    Conectar API
    Consultar cliente
Alterar cliente
    [Tags]  alterarCliente
    Conectar API
    Alterar cliente 1
    Alterar cliente 2
    Alterar cliente 3
Deletar cliente
    [Tags]  deletarCliente
    Conectar API
    Deletar Cliente
    Deletar Cliente
    Deletar Cliente
Cadastrar Serviço
    [Tags]  cadastrarServicos
    Conectar API Cadastro Servicos
    Cadastrar Banho
    Cadastrar Tosa
    Cadastrar Banho e Tosa
Deletar Serviço
    [Tags]  deletarServicos
    Conectar API Cadastro Servicos
    Deletar Servico
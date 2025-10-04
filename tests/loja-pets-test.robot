*** Settings ***
Resource    /home/runner/work/RobotExemploPetStore/RobotExemploPetStore/Services/api-Pets/loja-pets-service.robot
Resource    ${EXECDIR}/config/base.robot
Resource    /home/runner/work/RobotExemploPetStore/RobotExemploPetStore/Services/api-Pets/loja-pets-service.robot
Library     Collections
Library     FakerLibrary
Library     String

# Funcionalidade: Gerenciamento de Clientes e Serviços

# Eu, como PO,
# Quero cadastrar, consultar, alterar e excluir clientes,
# E também cadastrar e excluir serviços,
# Para garantir que o sistema funciona corretamente.

*** Test Cases ***

# Cenário: Cadastro de clientes
# Dado que eu queira cadastrar clientes
# Quando eu realizar o POST no endpoint /create
# Então devo visualizar que os cadastros foram criados com sucesso.
Validar criação do cliente 
    [Tags]  criarCliente
    Conectar API
    Criar cliente
    Criar cliente
    Criar cliente

# Cenário: Consulta de cliente
# Dado que eu queira consultar os dados de um cliente
# Quando eu realizar o GET no endpoint /create
# Então devo visualizar as informações corretamente.
Consultar cliente
    [Tags]  consultarCliente
    Conectar API
    Consultar cliente

# Cenário: Alteração de cliente
# Dado que eu queira alterar o cadastro de um cliente
# Quando eu realizar o PUT no endpoint /create
# Então devo visualizar que as informações foram alteradas com sucesso.
Alterar cliente
    [Tags]  alterarCliente
    Conectar API
    Alterar cliente 1
    Alterar cliente 2
    Alterar cliente 3

# Cenário: Exclusão de cliente
# Dado que eu queira deletar o cadastro de um cliente
# Quando eu realizar o DELETE no endpoint /create
# Então devo visualizar que os dados foram excluídos corretamente.
Deletar cliente
    [Tags]  deletarCliente
    Conectar API
    Deletar Cliente
    Deletar Cliente
    Deletar Cliente

# Cenário: Cadastro de serviços
# Dado que eu queira cadastrar serviços
# Quando eu realizar o POST no endpoint /create
# Então devo visualizar que os serviços foram criados com sucesso.
Cadastrar Serviço
    [Tags]  cadastrarServicos
    Conectar API Cadastro Servicos
    Cadastrar Banho
    Cadastrar Tosa
    Cadastrar Banho e Tosa

# Cenário: Exclusão de serviços
# Dado que eu queira deletar serviços
# Quando eu realizar o DELETE no endpoint /create
# Então devo visualizar que os serviços foram excluídos corretamente.
Deletar Serviço
    [Tags]  deletarServicos
    Conectar API Cadastro Servicos
    Deletar Servico

*** Settings ***
Library     RequestsLibrary
Library     FakerLibrary
Library     JSONLibrary
Library     Collections
Library     DateTime
Library     random.py

*** Variable ***
${URL}      https://5fa6fb8a085bf700163dec06.mockapi.io/petstore
${pet}
${password}
${tipoBanho}
${fakeValor}
${tipoTosa}
${tipoBanhoTosas}
${status}
${desconto}
*** Keywords ***
Gerador de primeiro nome aleatorios
    ${firstName}=    FakerLibrary.First Name
    Set Global Variable     ${firstName}
    [Return]    ${firstName}

Gerador de ultimo nome aleatorios
    ${lastName}=    FakerLibrary.Last Name
    Set Global Variable     ${lastName}
    [Return]    ${lastName}

Gerador de user aleatorios
    ${user}=    FakerLibrary.User Name
    Set Global Variable     ${user}
    [Return]    ${user}

Gerador de email aleatorios
    ${email}=    FakerLibrary.Email
    Set Global Variable     ${email}
    [Return]    ${email}

Gerador de senha aleatorios
    ${password}=    FakerLibrary.Password   10      True
    [Return]    ${password}

Gerador de telefone aleatorios
    ${phone}=    FakerLibrary.Phone Number
    Set Global Variable     ${phone}
    [Return]    ${phone}

Gerador de numeros aleatorios
    ${fakerNumber}=    FakerLibrary.Random Number 7     True
    Set Global Variable     ${fakerNumber}
    [Return]    ${fakerNumber}

Gerador de valores aleatorios
    ${fakeValor}=       FakerLibrary.Random Number    3   True
    Set Global Variable     ${fakeValor}
    ${fakeValor}=   Catenate    R$${fakeValor},00
    [Return]    ${fakeValor}

Gerador de nome de animais aleatorios   
    ${scalar}=  Create List     Tartaruga tigre dágua      Furão      Iguana       Tarântula          Porquinho-da-índia       Hamster          Coelho     Gatos       Cachorro        Cobra  
    Set Global Variable     ${pet}
    ${pet}=  Evaluate  random.choice($scalar)  random
    [Return]    ${pet}

Gerador de tipos de banhos
    ${scalar}=  Create List     Normal      Top     Premium
    Set Global Variable     ${tipoBanho}
    ${tipoBanho}=  Evaluate  random.choice($scalar)  random
    [Return]    ${tipoBanho}

Gerador de tipos de tosas
    ${scalar}=  Create List     Tosa completa       Tosa media      Tosa especial
    Set Global Variable     ${tipoTosa}
    ${tipoTosa}=  Evaluate  random.choice($scalar)  random
    [Return]    ${tipoTosa}

Gerador de tipos de banhos e tosas
    ${scalar}=  Create List     Normal+Tosa completa        Top+Tosa media      Premium+Tosa especial
    Set Global Variable     ${tipoBanhoTosas}
    ${tipoBanhoTosas}=  Evaluate  random.choice($scalar)  random
    [Return]    ${tipoBanhoTosas}

Status
    ${scalar}=     Create List     Aprovado    Negado
    Set Global Variable     ${status}
    ${status}=  Evaluate  random.choice($scalar)  random
    [Return]    ${status}

Calcular Porcentagem de Desconto
    ${desconto}  Evaluate  (1 - (50 / ${fakeValor})) * 100
    Set Global Variable     ${desconto}
    [Return]  ${desconto}

Conectar API 
    Create Session  criarCliente   ${URL}       #disable_warnigs=1       #verify=${false}     #proxies=${proxies}  
    Create Session  consultarCliente    ${URL}
    Create Session  alterarCliente      ${URL}
    Create Session  deletarCliente      ${URL}
    
Conectar API Cadastro Servicos
    Create Session  cadastrarServicos       ${URL}
    Create Session  deletarServicos       ${URL}

Criar cliente
    #${proxies} =    Create Dictionary   http=https://mockapi.io/projects    http=https://mockapi.io/projects
    ${user} =   Gerador de user aleatorios
    ${firstName} =  Gerador de primeiro nome aleatorios
    ${lastName} =   Gerador de ultimo nome aleatorios
    ${email} =   Gerador de email aleatorios
    ${password} =   Gerador de senha aleatorios
    ${phone} =      Gerador de telefone aleatorios
    ${pet} =    Gerador de nome de animais aleatorios
    #${body}     Get File    ../data/create.py

    ${body}     Criar Usuario   ${user}    ${firstName}    ${lastName}      ${pet}    ${email}    ${password}    ${phone}
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     POST On Session     criarCliente    /create     json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Consultar cliente
    ${body}     Consultar Usuario
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     GET On Session     consultarCliente    /create     json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Alterar cliente 1
    ${user} =   Gerador de user aleatorios
    ${firstName} =  Gerador de primeiro nome aleatorios
    ${lastName} =   Gerador de ultimo nome aleatorios
    ${email} =   Gerador de email aleatorios
    ${password} =   Gerador de senha aleatorios
    ${phone} =      Gerador de telefone aleatorios
    ${pet} =    Gerador de nome de animais aleatorios

    ${body}     Alterar Usuario      ${user}    ${firstName}    ${lastName}      ${pet}    ${email}    ${password}    ${phone}
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     PUT On Session     alterarCliente    /create/1     json=${body}    expected_status=any
    ${response}     PUT On Session     alterarCliente    /create/2     json=${body}    expected_status=any
    ${response}     PUT On Session     alterarCliente    /create/3     json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Alterar cliente 2 
    ${user} =   Gerador de user aleatorios
    ${firstName} =  Gerador de primeiro nome aleatorios
    ${lastName} =   Gerador de ultimo nome aleatorios
    ${email} =   Gerador de email aleatorios
    ${password} =   Gerador de senha aleatorios
    ${phone} =      Gerador de telefone aleatorios
    ${pet} =    Gerador de nome de animais aleatorios

    ${body}     Alterar Usuario      ${user}    ${firstName}    ${lastName}      ${pet}    ${email}    ${password}    ${phone}
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     PUT On Session     alterarCliente    /create/2     json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Alterar cliente 3
    ${user} =   Gerador de user aleatorios
    ${firstName} =  Gerador de primeiro nome aleatorios
    ${lastName} =   Gerador de ultimo nome aleatorios
    ${email} =   Gerador de email aleatorios
    ${password} =   Gerador de senha aleatorios
    ${phone} =      Gerador de telefone aleatorios
    ${pet} =    Gerador de nome de animais aleatorios

    ${body}     Alterar Usuario      ${user}    ${firstName}    ${lastName}      ${pet}    ${email}    ${password}    ${phone}
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     PUT On Session     alterarCliente    /create/3     json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Deletar Cliente
    ${body}     Deletar Usuario
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     DELETE On Session     deletarCliente    /create/1     json=${body}    expected_status=any
    ${response}     DELETE On Session     deletarCliente    /create/2     json=${body}    expected_status=any
    ${response}     DELETE On Session     deletarCliente    /create/3     json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Cadastrar Banho
    ${tipoBanho} =  Gerador de tipos de banhos
    ${pet} =    Gerador de nome de animais aleatorios   
    ${fakeValor} =  Gerador de valores aleatorios
    ${status} =     Status
    ${desconto} =   Calcular Porcentagem de Desconto

    ${body}  Banho      ${tipoBanho}    ${pet}     ${fakeValor}    ${desconto}    ${status}
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     POST On Session     cadastrarServicos    /create     json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Cadastrar Tosa
    ${tipoTosa} =   Gerador de tipos de tosas
    ${pet} =    Gerador de nome de animais aleatorios   
    ${fakeValor} =  Gerador de valores aleatorios
    ${status} =     Status
    ${desconto} =    Calcular Porcentagem de Desconto

    ${body}     Tosa      ${tipoTosa}     ${pet}      ${fakeValor}        ${desconto}         ${status}     
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     POST On Session     cadastrarServicos    /create   json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Cadastrar Banho e Tosa
    ${tipoBanhoTosa} =   Gerador de tipos de banhos e tosas
    ${pet} =    Gerador de nome de animais aleatorios   
    ${fakeValor} =  Gerador de valores aleatorios   
    ${status} =     Status
    ${desconto} =    Calcular Porcentagem de Desconto 

    ${body}     Combo    ${tipoBanhoTosa}        ${pet}      ${fakeValor}        ${desconto}     ${status}           
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     POST On Session     cadastrarServicos    /create   json=${body}    expected_status=any
    LOG     ${response.json()}
    [return]    ${response.json()}

Deletar Servico
    ${body}     Deletar Servicos
    Log     ${body}
    &{headers}  Create dictionary
    ...     Content-Type=Application/json
    ${response}     DELETE On Session     deletarServicos    /create/1   json=${body}    expected_status=any
    ${response}     DELETE On Session     deletarServicos    /create/2   json=${body}    expected_status=any
    ${response}     DELETE On Session     deletarServicos    /create/3   json=${body}    expected_status=any

    LOG     ${response.json()}
    [return]    ${response.json()}
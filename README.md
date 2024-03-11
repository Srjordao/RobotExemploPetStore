# Projeto Teste 

Projeto para aprender a automatizar apis publicas. 

*** Configurações ***

Instalar Python 3.10 ou ultima versão e RobotFramework ultima versão
pip install -r requirements.txt
pip install robotframework

*** Estrutura de Pastas ***

Data - Body das chamadas da APIS e massas.

Services - Requisições das APIS.

Tests - Suítes de testes.


*** Pipeline ***

Além disso, foi estabelecida uma robusta pipeline de testes utilizando o Jenkins para automação do processo de integração contínua. Essa pipeline é responsável por executar os testes definidos no projeto após cada alteração no repositório. Após a conclusão dos testes, o Jenkins envia notificações para um canal específico no Slack, informando o status da execução dos testes. Essa integração contínua proporciona uma abordagem eficiente para garantir a qualidade do código e facilita a colaboração da equipe ao manter todos os membros informados sobre o estado dos testes.

________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

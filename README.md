# Projeto de Teste de APIs

Este projeto visa proporcionar uma experiência prática na automatização de chamadas a APIs públicas. Utiliza-se o Python 3.10 ou a versão mais recente, juntamente com o Robot Framework, permitindo uma abordagem eficiente e simplificada para criar testes automatizados para APIs.

***Configurações***

Antes de utilizar o projeto, certifique-se de instalar o Python 3.10 ou a última versão disponível, assim como o Robot Framework, utilizando os seguintes comandos:
```
pip install -r requirements.txt
pip install robotframework
```

***Estrutura de Pastas***

O projeto segue uma estrutura organizada em pastas:

- **Data**: Contém os corpos das chamadas das APIs e massas de dados.
  
- **Services**: Responsável por realizar as requisições às APIs.

- **Tests**: Aqui são definidas as suítes de testes.

***Pipeline***

Uma robusta pipeline de testes foi estabelecida utilizando o Jenkins para automatizar o processo de integração contínua. Esta pipeline executa os testes definidos no projeto após cada alteração no repositório. Ao término dos testes, o Jenkins envia notificações para um canal específico no Slack, mantendo toda a equipe informada sobre o status da execução dos testes. Essa integração contínua garante a qualidade do código e facilita a colaboração da equipe.

________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

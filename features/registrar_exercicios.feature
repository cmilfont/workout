# language: pt
Funcionalidade: Registrar exercícios
  Para acompanhar meus treinos
  Como um atleta
  Eu quero registrar meus exercícios

  Contexto:
    Dado que estou logado

  Cenário: Informar um treino de corrida
    Dado que estou em "cadastro de treino"
      E que preencho "Data" com "09/10/2009"
      E que eu clico em "Incluir Exercício"
      E que seleciono "Tipo de exercício" com "Corrida"
      E que preencho "Hora inicial" com "20:00:00"
      E que preencho "Hora final" com "20:30:00"
      E que preencho "Tempo" com "30"
      E que preencho "Frequência Cardíaca" com "153"
      E que preencho "Distância" com "4"
      E que seleciono "Medida" com "km"
    Quando eu clicar em "Inserir exercício[s]"
    Então eu deverei ver "Exercício de Corrida cadastrado[a] com sucesso."

  Cenário: Informar um treino de corrida com latitude e longitude
    Dado que estou em "cadastro de treino"
      E que preencho "Data" com "09/10/2009"
      E que eu clico em "Incluir Exercício"
      E que seleciono "Tipo de exercício" com "Corrida"
      E que preencho "Hora inicial" com "20:00:00"
      E que preencho "Hora final" com "20:30:00"
      E que preencho "Tempo" com "30"
      E que preencho "Frequência Cardíaca" com "153"
      E que informo as coordenadas
      |latitude  |longitude|
      |-33.46789 |         |
      |-33.46895 |         |
      |-33.47096 |         |
    Quando eu clicar em "Inserir exercício[s]"
    Então eu deverei ver "Exercício de Corrida cadastrado[a] com sucesso."

  Cenário: Informar um treino de jiujitsu
    Dado que estou em "cadastro de treino"
      E que preencho "Data" com "09/10/2009"
      E que eu clico em "Incluir Exercício"
      E que seleciono "Tipo de exercício" com "Jiujitsu"
      E que preencho "Hora inicial" com "20:00:00"
      E que preencho "Hora final" com "20:30:00"
      E que preencho "Repetições" com "10"
      E que preencho "Nome" com "Raspada a partir da guarda"
      E que eu clico em "Incluir Exercício"
      E que seleciono "Tipo de exercício" com "Jiujitsu"
      E que preencho "Hora inicial" com "20:00:00"
      E que preencho "Hora final" com "20:30:00"
      E que preencho "Repetições" com "10"
      E que preencho "Nome" com "Defesa de montada"
    Quando eu clicar em "Inserir exercício[s]"
    Então eu deverei ver "Exercício de Jiujitsu cadastrado[a] com sucesso."

  Cenário: Adicionar vídeos
    Dado que estou em "Listagem de Treinos"
      E que encontro o treino de "09/10/2009"
      E que clico em "Adicionar vídeo"
      E que preencho "Link do Vídeo" com "http://www.youtube.com/watch?v=KYnwrFChQns"
    Quando eu clicar em "Incluir vídeo"
    Então eu deverei ver "Vídeo incluído com sucesso."

  Cenário: Adicionar tags
    Dado que estou em "Listagem de Treinos"
      E que encontro o treino de "09/10/2009"
      E que preencho "Tag" com "corrida,"
      E que vejo a mensagem "Separe as tags por vírgula"
      E que vejo a mensagem "ex: jiujitsu,artes marciais,luta"
    Quando eu clicar em "Incluir tag"
    Então eu deverei ver "Tag[s] incluída[s] com sucesso."


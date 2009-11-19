# language: pt
Funcionalidade: Registrar peso
  Para acompanhar meu emagrecimento
  Como um atleta
  Eu quero registrar meu peso atual

  Contexto:
    Dado que estou logado
    Dado que existe(m) o(s) seguinte(s) registro(s) de weight:
      | weight      | created_at        | user_id |
      | 57.000 kg   | 11/02/2009 18:42  | 1       |
      | 56.650 kg   | 11/02/2009 18:42  | 1       |


  Cenário: Registar o peso atual
    Dado que estou em "Perfil"
      E que eu clico no link "Registre seu peso atual"
      E que preencho "Peso" com "96.255"
    Quando eu clicar em "Registrar"
    Então desejo ver a mensagem "Peso atual: 96.255 kg "
  @wip
  Cenário: Exibir os últimos 10 registros de peso
    Dado que estou em "Perfil"
      E que eu clico no link "Registre seu peso atual"
    Então desejo ver os seguintes registros:
      | Peso        | Data              |
      | 57.000 kg   | 11/02/2009 18:42  |
      | 56.650 kg   | 11/02/2009 18:42  |


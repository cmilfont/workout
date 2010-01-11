# language: pt
Funcionalidade: Registrar meta de peso
  Para alcançar um objetivo de emagrecimento numa data específica
  Como um atleta
  Eu quero registrar minha meta de peso atual

  Contexto:
    Dado que estou logado

  Cenário: Registar minha meta de peso atual
    Dado que estou em "Perfil"
      E que eu clico no link "Crie sua meta de peso"
      E que preencho "Peso" com "91.000"
      E selecione a data com "10" de "10" de "2010" em "Meta"
    Quando eu clicar em "Registrar"
    Então desejo ver a mensagem "Meta de peso: 91.000 kg"


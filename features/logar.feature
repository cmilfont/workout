# language: pt
Funcionalidade: Entrar no sistema
  Para registrar minha evolução
  Como um atleta
  Eu quero me logar

  Cenário: logar-me
    Dado um perfil criado
      E que estou em "Log in"
      E que preencho "Login" com "cmilfont"
      E que preencho "Senha" com "123456"
    Quando eu clicar em "Login"
    Então desejo ver a mensagem "Seja bem-vindo[a]"
    Então desejo ver a mensagem "Christiano Milfont"


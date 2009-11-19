# language: pt
Funcionalidade: Criar conta
  Para registrar meus exercícios
  Como um atleta
  Eu quero criar um perfil

  Cenário: registrar-me
    Dado que estou em "Criar Perfil"
      E que preencho "Login" com "cmilfont"
      E que preencho "Nome" com "Christiano Milfont"
      E que preencho "Senha" com "123456"
      E que preencho "Confirmação de senha" com "123456"
      E que preencho "E-mail" com "cmilfont@gmail.com"
    Quando eu clicar em "Registrar"
    Então desejo ver a mensagem "Perfil criado com sucesso!"
      E deverei ver o link "Continue completando seu perfil."

  Cenário: logar-me
    Dado um perfil criado
      E que estou em "Log in"
      E que preencho "Login" com "cmilfont"
      E que preencho "Senha" com "123456"
    Quando eu clicar em "Login"
    Então desejo ver a mensagem "Seja bem-vindo[a] Christiano Milfont!"


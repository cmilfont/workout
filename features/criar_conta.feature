# language: pt
Funcionalidade: Criar conta
  Para participar do sistema
  Como um atleta
  Eu quero criar um perfil

  Cenário: registrar-me
    Dado que estou em "REGISTRAR"
      E que preencho "Login" com "cmilfont"
      E que preencho "Nome" com "Christiano Milfont"
      E que preencho "Senha" com "123456"
      E que preencho "Confirmação de senha" com "123456"
      E que preencho "E-mail" com "cmilfont@gmail.com"
      E que preencho "Altura" com "180"
    Quando eu clicar em "Registrar"
    Então desejo ver a mensagem "Seja bem-vindo[a]"
      E deverei ver o link "Continue completando seu perfil."


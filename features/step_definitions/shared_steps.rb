Dado /^que estou em "([^\"]*)"$/ do |page_name|
  @browser.set_speed(2000)
  @browser.open path_to(page_name)
end

Dado /^selecione "([^\"]*)" em "([^\"]*)"$/ do |value, field|
  @browser.set_speed(2000)
  @browser.select '//*[@id=(//label[text()="'+field+'"]/@for)]', value
end

Dado /^selecione a hora com "([^\"]*)" de "([^\"]*)" de "([^\"]*)" as "([^\"]*)":"([^\"]*)" em "([^\"]*)"$/ do |dia, mes, ano, hora, minuto, input|

  xpath_1 = "//select[starts-with(@id, concat(//label[text()='"
  xpath_2 = "']/@for, '_"
  xpath_3 = "i') )]"
  @browser.set_speed(2000)
  @browser.type xpath_1 + input + xpath_2 + 3.to_s + xpath_3, dia
  @browser.type xpath_1 + input + xpath_2 + 2.to_s + xpath_3, mes
  @browser.type xpath_1 + input + xpath_2 + 1.to_s + xpath_3, ano
  @browser.type xpath_1 + input + xpath_2 + 4.to_s + xpath_3, hora
  @browser.type xpath_1 + input + xpath_2 + 5.to_s + xpath_3, minuto
end

Dado /^selecione a data com "([^\"]*)" de "([^\"]*)" de "([^\"]*)" em "([^\"]*)"$/ do |dia, mes, ano, input|

  xpath_1 = "//select[starts-with(@id, concat(//label[text()='"
  xpath_2 = "']/@for, '_"
  xpath_3 = "i') )]"
  @browser.set_speed(2000)
  @browser.type xpath_1 + input + xpath_2 + 3.to_s + xpath_3, dia
  @browser.type xpath_1 + input + xpath_2 + 2.to_s + xpath_3, mes
  @browser.type xpath_1 + input + xpath_2 + 1.to_s + xpath_3, ano
end


Dado /^que eu clico no link "([^\"]*)"$/ do |link|
  @browser.set_speed(2000)
  @browser.click '//a[text()="' + link + '"]'
end


Dado /^que preencho "([^\"]*)" com "([^\"]*)"$/ do |field, value|
  @browser.set_speed(2000)
  @browser.type '//input[@id=(//label[text()="'+field+'"]/@for)]', value
end

Quando /^eu clicar em "([^\"]*)"$/ do |button|
  @browser.set_speed(2000)
  @browser.click '//input[@value="'+button+'"]'
end

Então /^desejo ver a mensagem "([^\"]*)"$/ do |text|
  @browser.set_speed(2000)
  assert @browser.is_text_present(text)
end

Então /^deverei ver o link "([^\"]*)"$/ do |link|
  @browser.set_speed(2000)
  assert @browser.is_element_present '//a[text()="' + link + '"]'
end

Então /^desejo ver os seguintes registros:$/ do |tabela|
  tabela.hashes.each do |hash|
    hash.each_value do |valor|
      valor = Time.now.strftime("%d/%m/%Y") if valor == 'HOJE'
      assert @browser.is_text_present valor
    end
  end
end

Dado /^um perfil criado$/ do
  Factory :user
end

Dado /^que estou logado$/ do
  Dado "um perfil criado"
  Dado "que estou em \"Log in\""
  Dado "que preencho \"Login\" com \"cmilfont\""
  Dado "que preencho \"Senha\" com \"123456\""
  Dado "eu clicar em \"Login\""
end

Dado /^que existe\(m\) o\(s\) seguinte\(s\) registro\(s\) de (.+):$/ do |entidade, tabela|
  simbolo_da_entidade = entidade.gsub(/\s/, '_').to_sym
  classe = simbolo_da_entidade.to_s.camelize.constantize
  classe = entidade.gsub(/\s/, '_').camelize.constantize
  classe.transaction do
    classe.destroy_all
    tabela.hashes.each do |registro|
      parametros = {}
      registro.each_pair do |chave, valor|
        #chave = chave.gsub(/\s/, '_')
        #valor = true if valor == 'Sim'
        #valor = false if valor == 'Não'
        parametros[chave] = valor
      end
      Factory simbolo_da_entidade, parametros
    end
  end
end


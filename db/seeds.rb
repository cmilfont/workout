# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Exercicio.create :titulo => "Alongamento", :descricao => "Alongar"
cl = Exercicio.create :titulo => "Corrida Leve", :descricao => "corrida"
cr = Exercicio.create :titulo => "Corrida Rapida", :descricao => "corrida"
Exercicio.create :titulo => "Polichinelos", :descricao => "Polichinelos"
Exercicio.create :titulo => "Flexoes", :descricao => "Flexoes"

Rotina.create :titulo => "Treino Funcional"
Rotina.create :titulo => "Treino de Jiujitsu"
rotina = Rotina.create :titulo => "Corrida"

Item.create :rotina_id => rotina.id, 
            :exercicio_id => cl.id,
            :repeticao => 2,
            :tempo => "00:10:00"

Item.create :rotina_id => rotina.id, 
            :exercicio_id => cr.id,
            :repeticao => 1,
            :tempo => "01:00:00"
Ext.define('Workout.model.Item', {
  extend: 'Ext.data.Model',
  fields: [
    'id','repeticao', 'tempo', 'rotina_id', 'exercicio_id'
  ],
  //hasMany: [{model: "Workout.model.Item", name: "itens", associationKey: 'itens'}]
  belongsTo:[{model: 'Workout.model.Exercicio', associationKey: 'exercicio', getterName: 'exercicio'}],
  proxy: {
    type: 'rest', format: 'json', url: '/itens'
  }
});
Ext.define('Workout.model.Item', {
  extend: 'Ext.data.Model',
  fields: [
    'id','repeticao', 'tempo', 'rotina_id', 'exercicio_id'
  ],
  belongsTo:[{model: 'Workout.model.Exercicio', associationKey: 'exercicio', getterName: 'exercicio'}]
});
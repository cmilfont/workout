Ext.define('Workout.model.Rotina', {
  extend: 'Ext.data.Model',
  proxy: {
    type: 'rest', format: 'json', url: '/rotinas'
  },
  fields: ['titulo', {name:'id', mapping:'id'}],
  hasMany: [
    {model: 'Workout.model.Item', name: 'itens', associationKey: 'itens'}
  ]
});

Ext.define('Workout.model.RotinaTree', {
  extend: 'Ext.data.Model',
  proxy: {
    type: 'rest', format: 'json', url: '/rotinas'
  },
  fields: ['id', 'titulo', 'exercicio', 'repeticao', 'tempo'],
  hasMany: [
    {model: 'Workout.model.Item', name: 'itens', associationKey: 'itens'}
  ]
});
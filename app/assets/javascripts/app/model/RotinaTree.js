Ext.define('Workout.model.RotinaTree', {
  extend: 'Ext.data.Model',
  proxy: {
    type: 'rest', format: 'json', url: '/rotinas'
  },
  fields: ['id', 'titulo', 'exercicio', 'repeticao', 'tempo', 'itemId'],
  hasMany: [
    {model: 'Workout.model.Item', name: 'itens', associationKey: 'itens'}
  ]
});
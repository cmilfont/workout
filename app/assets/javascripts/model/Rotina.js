Ext.define('Workout.model.Rotina', {
  extend: 'Ext.data.Model',
  proxy: {
    type: 'rest',
    format: 'json',
    url: '/rotinas'
  },
  fields: [
    'id',
    'titulo'
  ],
  hasMany: [
    {model: 'Workout.model.Item', name: 'getItens', associationKey: 'itens'}
  ]
});
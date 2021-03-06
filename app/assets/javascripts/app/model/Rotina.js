Ext.define('Workout.model.Rotina', {
  extend: 'Ext.data.Model',
  proxy: {
    type: 'rest', format: 'json', url: '/rotinas'
  },
  fields: ['titulo', 'id'],
  hasMany: [{model: "Workout.model.Item", name: "itens", associationKey: 'itens'}]
});
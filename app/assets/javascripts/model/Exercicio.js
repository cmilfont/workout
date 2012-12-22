Ext.define('Workout.model.Exercicio', {
  extend: 'Ext.data.Model',
  fields: ['id','titulo', 'descricao'],
  proxy: {
    type: 'rest', format: 'json', url: '/exercicios'
  }
});
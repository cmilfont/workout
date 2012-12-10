Ext.define('Workout.model.Rotina', {
  extend: 'Ext.data.Model',
  proxy: {
    type: 'rest',
    url: '/rotinas'
  },
  fields: [
    { name:'src', type:'string' },
    { name:'caption', type:'string' }
  ]
});
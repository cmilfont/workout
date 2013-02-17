//
//= require ../model/Exercicio
//= require ../store/Exercicios
//= require_tree ../view/exercicios/

Ext.define('Workout.controller.Exercicios', {
  extend: 'Ext.app.Controller',
  //requires: [ 'Workout.store.Exercicios'],
  models: ['Exercicio'],
  stores: ['Exercicios'],
  views: [
  'exercicios.Grid', 
  'exercicios.Form', 
  'exercicios.Window'
  ],
  addTabPanel: function(button) {
    var tabpanel = Ext.ComponentQuery.query("dtabpanel")[0];
            
    tabpanel.addTab({
      title: "Exercícios",
      itemId: "tab-" + button.controller,
      closable: true,
      controller: button.controller,
      xtype: 'exerciciogrid'
    });
    
  },
  init: function(button) {
    
    this.control({
      "exerciciogrid": {
        afterrender: function(grid) {
          grid.store.load();
        }
      }
    });
    
    this.addTabPanel(button);
    
  }
});
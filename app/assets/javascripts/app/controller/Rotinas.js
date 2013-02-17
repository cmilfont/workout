//
//= require_tree ../view/rotinas/

Ext.define('Workout.controller.Rotinas', {
  extend: 'Ext.app.Controller',
  requires: [
    'Workout.model.RotinaTree',
    'Workout.store.Rotinas'
  ],
  views: ['rotinas.List', 'rotinas.Form', 'rotinas.ExercicioForm'],
  models: ['Rotina', 'RotinaTree','Item', 'Exercicio'],
  stores: ['Rotinas'],
  init: function() {
    this.control({
      "rotinaslist": {
        afterrender: function(view) {
          //view.store.load();
        }
      }
    });
  },
  
  onTabAdd: function(button) {
    this.getTabPanel().addTab({
      title: button.text,
      itemId: "tab-" + button.text,
      closable: true,
      xtype: "rotinaslist"
    });
  }
  
  , getTabPanel: function() {
    return Ext.ComponentQuery.query("tabpanel[itemId='tabs']")[0];
  }
  
    
});
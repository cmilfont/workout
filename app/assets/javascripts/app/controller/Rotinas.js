//
//= require ../model/Exercicio
//= require ../model/Item
//= require ../model/Rotina
//= require ../model/RotinaTree
//= require ../store/Rotinas
//= require ../store/Exercicios
//= require ../view/rotinas/RotinaCrud
//= require ../view/rotinas/ExercicioCrud
//= require ../view/rotinas/Grid
//= require ../view/rotinas/Form
//= require ../view/rotinas/ExercicioForm

Ext.define('Workout.controller.Rotinas', {
  extend: 'Ext.app.Controller',
  // requires: [
  //   'Workout.model.RotinaTree',
  //   'Workout.store.Rotinas'
  // ],
  //views: ['rotinas.List', 'rotinas.Form', 'rotinas.ExercicioForm'],
  //models: ['Rotina', 'RotinaTree','Item', 'Exercicio'],
  //stores: ['Rotinas'],
  init: function(button) {
    this.addTabPanel(button);
  },
  addTabPanel: function(button) {
    this.getTabPanel().addTab({
      title: button.text,
      itemId: "tab-" + button.controller,
      closable: true,
      controller: button.controller,
      xtype: 'rotinaslist'
    });
    
  }
  
  , getTabPanel: function() {
    return Ext.ComponentQuery.query("tabpanel[itemId='tabs']")[0];
  }
  
    
});
Ext.define('Workout.controller.Exercicios', {
  extend: 'Ext.app.Controller',
  requires: [ 'Workout.store.Exercicios'],
  models: ['Exercicio'],
  stores: ['Exercicios'],
  views: ['exercicios.Grid', 'exercicios.Form', 'exercicios.Window'],
  addTabPanel: function(button) {
    console.log("Clicou em exercicio", this);
    var tabpanel = Ext.ComponentQuery
            .query("tabpanel[itemId='tabs']")[0];
            
    tabpanel.addTab({
      title: "Exercícios",
      itemId: "tab-" + button.text,
      closable: true,
      xtype: 'exerciciogrid'
    });
  },
  init: function() {
    this.control({
      "#exercicios": {
        click: this.addTabPanel
      },
      "exerciciogrid": {
        afterrender: function(grid) {
          grid.store.load();
        }
      }
    });
  }
});
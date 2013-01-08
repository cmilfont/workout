Ext.define("Workout.view.rotina.Exercicio", {
  vincular: function() {
    
    Ext.create("Ext.window.Window", {
      items: [{
        xtype: "exercicioform",  width: 400
      }]
    }).show()
  }
});
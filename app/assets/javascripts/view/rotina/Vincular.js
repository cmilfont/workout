Ext.define("Workout.view.rotina.Vincular", {
  vincularExercicio: function() {
    var tree = this;
    
    console.log("Arvore?", this);
    
    Ext.create("Ext.window.Window", {
      items: [{
        xtype: "exercicioform",  width: 400
      }]
    }).show()
  }
});
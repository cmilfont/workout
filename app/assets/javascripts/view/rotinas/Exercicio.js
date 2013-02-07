Ext.define("Workout.view.rotinas.Exercicio", {
  
  vincular: function() {
    var model = this.getSelectionModel().selected.first();
    Ext.create("Ext.window.Window", {
      modal: false,
      constrain: true,
      renderTo: this.el.dom,
      listeners: {
        show: this.mask,
        close: this.unmask,
        scope: this
      },
      items: [{
        xtype: 'rotinaexercicioform',
        rotina_id: model.getId(),
        listeners: {
          vinculado: {
            fn: this.store.adicionarItem,
            scope: model
          }
        }
      }]
    }).show();
  },
  
  desvincular: function() {
    Ext.Msg.show({
      title:'Desvincular o Exercício',
      msg: 'Deseja realmente desvincular o exercício dessa rotina de treinos?',
      buttons: Ext.Msg.YESNO,
      scope: this,
      fn: function(btn){
        if(btn == "yes") {
          var model = this.getSelectionModel().selected.first();
          console.log( model.item );
        }
          
          //this.getSelectionModel().getLastSelected().destroy();
      }
    });
  },
  
  
});
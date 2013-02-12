Ext.define("Workout.view.rotinas.ExercicioCrud", {
  
  //var tree = Ext.ComponentQuery.query("rotinaslist")[0]
  //var selecionado = tree.getSelectionModel().selected.first()
  
  vincular: function() {
    var model = this.getSelectionModel().selected.first();
    var item = { rotina_id: model.getId() };
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
        item: item,
        listeners: {
          vinculado: {
            fn: this.store.adicionarItem,
            scope: model
          }
        }
      }]
    }).show();
  },
  
  editarVinculo: function() {
    var selecionado = this.getSelectionModel().selected.first();
    var item = selecionado.raw.item;

    Ext.create("Ext.window.Window", {
      modal: false,
      items: [{
        xtype: 'rotinaexercicioform',
        item: item,
        listeners: { 
          vinculado: function(model){
            var json = Ext.apply(
                         {exercicio: model.exercicio().get("titulo")}, 
                         model.data);
            delete json.id;
            selecionado.set(json);
            selecionado.raw.item = model;
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
Ext.define("Workout.view.exercicios.Crud", {
  abrirJanela: function(button) {
    
    var model = null;
    if(button.text != "Cadastrar") {
      model = this.getSelectionModel().selected.first();
      if(!model) {
        Ext.Msg.alert("Erro", "Selecione um Exercício para editar");
        Ext.Error.notify = true;
        Ext.Error.raise({ msg: 'Selecione um Exercício para editar' });
      }

    }
    
    Ext.widget("exerciciowindow", {
      title: "Salvar exercício",
      boundary: this,
      items: [{
        xtype: "exercicioform",
        callbackSave: this.adicionar,
        callbackSaveScope: this,
        exercicio: model
      }]
    }).show();
  },
  adicionar: function(model) {
    var local = this.store.findRecord("id", model.getId());
    if ( local ) {
      local.set(model.data);
    } else {
      this.store.add(model);
    }
  },
  excluir: function() {
    Ext.Msg.show({
      title: "Excluir Exercício",
      msg: "Deseja realmente excluir esse Exercício?",
      buttons: Ext.Msg.YESNO,
      scope: this,
      fn: function(btn){
        if(btn == "yes") 
          this.getSelectionModel().selected.first().destroy();
      }
    });
  }
});
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
  adicionar: function(json) {
    
    var local = this.store.findRecord("id", json.id);
    if ( local ) {
      local.set(json);
    } else {
      this.store.add(json);
      this.store.sync();
    }
    
  },
  excluir: function() {
    
    Ext.Msg.show({
      title: "Excluir Exercício",
      msg: "Deseja realmente excluir esse Exercício?",
      buttons: Ext.Msg.YESNO,
      scope: this,
      fn: function(btn){
        if(btn == "yes") {
          var model = this.getSelectionModel().selected.first();
          this.store.remove(model);
          model.destroy;
        }
          
      }
    });
    
  }
});
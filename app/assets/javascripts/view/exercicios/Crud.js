Ext.define("Workout.view.exercicios.Crud", {
  abrirJanela: function(button) {
    
    var model = null;
    if(button.text != "Cadastrar") {
      model = this.getSelectionModel().selected.first();
      if(!model) {
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
    this.store.loadData([model], true);
  }
});
Ext.define("Workout.view.exercicios.Crud", {
  abrirJanela: function(button) {

    var model = this.selecionar(button.cadastro);
    var formPanel = Ext.widget('exercicioform', { exercicio: model });
    if(button.cadastro) formPanel.on("salvo", this.adicionar, this);

    var win = Ext.widget("exerciciowindow", {
      title: "Salvar exercício",
      boundary: this,
      items: [formPanel]
    });
    win.show();
    
    formPanel.on("salvo", win.close, win);
    
  },
  
  selecionar: function(isCadastro) {
    var model = null;
    if(!isCadastro) {
      model = this.getSelectionModel().selected.first();
      if(!model) {
        Ext.Msg.alert("Erro", "Selecione um Exercício para editar");
        Ext.Error.notify = true;
        Ext.Error.raise({ msg: 'Selecione um Exercício para editar' });
      }
    }
    return model;
  },
  adicionar: function(model) {
    this.store.add(model);    
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
          model.destroy({
              success : function() {
                  this.store.remove(model);
                  //this.store.sync();
              },
              scope: this
          });
          
        }
      }
    });
    
  }
});
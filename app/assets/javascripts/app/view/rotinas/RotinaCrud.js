Ext.define("Workout.view.rotinas.RotinaCrud", {
  
  excluir: function() {
    Ext.Msg.show({
      title:'Excluir Rotina',
      msg: 'Deseja realmente excluir essa rotina de treinos?',
      buttons: Ext.Msg.YESNO,
      scope: this,
      fn: function(btn){
        if(btn == "yes") 
          this.getSelectionModel().getLastSelected().destroy();
      }
    });
  },
  
  criarJanela: function(config) {
    return Ext.create("Ext.window.Window", config);
  },
  
  abrirJanela: function(button) {
    var model = null;
    if(button.text != "Cadastrar") model = this.getSelectionModel().getLastSelected();
    this.currentWindow = this.criarJanela({
      title: "Criar/Editar Rotina",
        items: [{
            xtype: "rotinasform", 
            salvarCallback: this.adicionar, 
            scopeSalvarCallback: this,
            model: model
        }]
    });
    this.currentWindow.show();
  },
  adicionar: function(json) {
    var model = this.getStore().getNodeById( json.id ),
        params = { scope: this, callback: this.adicionarRotinaNaTree};
    if( !model ) {
      model = Ext.create('Workout.model.Rotina', json);
    } else {
      model.set("titulo", json.titulo);
      params.callback = this.fecharESelecionar;
    }
    model.save( params );
  },
  
  adicionarRotinaNaTree: function(model) {
    var model = this.getRootNode().appendChild({
       leaf: true,
       id:  model.getId(),
       titulo: model.get("titulo")
    });
    this.fecharESelecionar(model);
  },
  
  fecharESelecionar : function(model) {
    this.getSelectionModel().deselectAll()
    this.currentWindow.close();
    this.getSelectionModel().select( model );
  }
  
  
});
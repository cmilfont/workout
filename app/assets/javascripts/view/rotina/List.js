Ext.define('Workout.view.rotina.List', {
  extend: 'Ext.tree.Panel',
  alias: 'widget.rotinalist',
  mixins: {
    vincular: "Workout.view.rotina.Vincular"
  },
  store: Ext.createByAlias("store.rotinas"),
  columns: [
     { text: "", dataIndex: "id", xtype: "treecolumn" },
     { text: 'Rotina', sortable: false, flex: 2, dataIndex: 'titulo'},
     { text: 'Exercicio', sortable: false, flex: 2, dataIndex: 'exercicio' }
  ],
  selModel: {
    allowDeselect: true
  },
  singleExpand: true,
	rootVisible: false,
	constructor: function() {
	  this.tbar = [
      { xtype: 'button', text: 'Cadastrar' , pressed: true, handler: this.abrirJanela, scope: this},
      { xtype: 'button', text: 'Editar', itemId: 'editar', disabled: true, pressed: true, handler: this.abrirJanela, scope: this },
      { xtype: 'button', text: 'Excluir', itemId: 'excluir', disabled: true, pressed: true, handler: this.excluir, scope: this },
      "-"
    ];
    this.callParent(arguments);
    this.on({
       select: this.habilitarAoSelecionar,
       deselect: this.desabilitarAoSelecionar,
       scope: this
     });
  },
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
            xtype: "rotinaform", 
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
  },
  
  desabilitarAoSelecionar: function(rowModel, model, index, eOpts) {
    this.down("#editar").disable();
    this.down("#excluir").disable();
    
    var vincular = this.down("#vincular"),
        editarexercicio = this.down("#editarexercicio"),
        desvincular = this.down("#desvincular");
    if(vincular) vincular.destroy();
    if(editarexercicio) editarexercicio.destroy();
    if(desvincular) desvincular.destroy();
  },
  habilitarAoSelecionar: function(rowModel, model, index, eOpts) {
    var docked = this.getDockedItems()[0];
    if(!model.raw.item) {
      this.down("#editar").enable();
      this.down("#excluir").enable();
      docked.add({ text: "Vincular Exercicio", scope: this, handler: this.vincularExercicio, pressed: true, itemId: "vincular" })
    } else {
      docked.add({ text: "Editar Exercicio", handler: function(){}, pressed: true, itemId: "editarexercicio" })
      docked.add({ text: "Desvincular Exercicio", handler: function(){}, pressed: true, itemId: "desvincular" })
    }
  }
});
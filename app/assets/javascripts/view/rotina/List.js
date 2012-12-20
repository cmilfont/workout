Ext.define('Workout.view.rotina.List', {
  extend: 'Ext.tree.Panel',
  alias: 'widget.rotinalist',
  store: Ext.create("Workout.store.RotinaStore"),
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
      { xtype: 'button', text: 'Excluir', itemId: 'excluir', disabled: true, pressed: true, handler: this.excluir, scope: this }
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
  abrirJanela: function(button) {
    var model = null;
    if(button.text != "Cadastrar") model = this.getSelectionModel().getLastSelected();
    Ext.create("Ext.window.Window", {
      title: "Criar Rotina",
        items: [{
            xtype: "rotinaform", 
            salvarCallback: this.adicionar, 
            scopeSalvarCallback: this,
            model: model
        }]
    }).show();
  },
  adicionar: function(json) {
    var id = json["id"];
    var model = this.getStore().getNodeById( id );
    if( !model ) {
      model = Ext.create('Workout.model.Rotina', json);
       model.save({
         scope: this,
         callback: function(rec){
           this.getRootNode().appendChild({
              leaf: true,
              id:  id,
              titulo: model.get("titulo"),
              exercicio: ""
           });
         } 
       });
     } else {
       model.set("titulo", json.titulo);
     }
     
  },
  desabilitarAoSelecionar: function() {
    this.down("#editar").disable();
    this.down("#excluir").disable();
  },
  habilitarAoSelecionar: function() {
    this.down("#editar").enable();
    this.down("#excluir").enable();
  }
});
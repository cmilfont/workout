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
      { xtype: 'button', text: 'Editar', itemId: 'editar', disabled: true, pressed: true },
      { xtype: 'button', text: 'Excluir', itemId: 'excluir', disabled: true, pressed: true }
    ];
    this.callParent(arguments);
    this.on({
       select: this.habilitarAoSelecionar,
       deselect: this.desabilitarAoSelecionar,
       scope: this
     });
  },
  abrirJanela: function() {
    Ext.create("Ext.window.Window", {
      title: "Criar Rotina",
        items: [{
            xtype: "rotinaform", salvarCallback: this.adicionar, scopeSalvarCallback: this
        }]
    }).show();
  },
  adicionar: function(model) {
    model.set("leaf", true);
    this.getRootNode().appendChild(model);
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
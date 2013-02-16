Ext.define('Workout.view.rotinas.List', {
  extend: 'Ext.tree.Panel',
  alias: 'widget.rotinaslist',
  mixins: {
    rotina: "Workout.view.rotinas.RotinaCrud",
    exercicio: "Workout.view.rotinas.ExercicioCrud"
  },
  store: Ext.createByAlias("store.rotinas"),
  selModel: { allowDeselect: true },
  singleExpand: false,
	rootVisible: false,
  columns: [
     { text: "", dataIndex: "id", xtype: "treecolumn" },
     { text: 'Rotina', sortable: false, flex: 2, dataIndex: 'titulo'},
     { text: 'Exercicio', sortable: false, flex: 2, dataIndex: 'exercicio' },
     { text: 'Repetições', sortable: false, flex: 2, dataIndex: 'repeticao' },
     { text: 'Tempo', sortable: false, flex: 2, dataIndex: 'tempo' }
  ],
  constructor: function() {
	  var buttonConfig = { xtype: 'button', pressed: true, scope: this };
	  this.tbar = [
      Ext.apply({ text: 'Cadastrar', handler: this.abrirJanela}, buttonConfig) ,
      Ext.apply({ text: 'Editar', handler: this.abrirJanela, itemId: 'editar', disabled: true }, buttonConfig),
      Ext.apply({ text: 'Excluir', handler: this.excluir, itemId: 'excluir', disabled: true }, buttonConfig),
      "-"
    ];
    this.callParent(arguments);
    this.on({
       select: this.habilitarAoSelecionar,
       deselect: this.desabilitarAoSelecionar,
       scope: this
     });
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
      docked.add({ text: "Vincular Exercicio", scope: this, handler: this.vincular, pressed: true, itemId: "vincular" })
    } else {
      docked.add({ text: "Editar Exercicio", handler: this.editarVinculo, pressed: true, itemId: "editarexercicio" })
      docked.add({ text: "Desvincular Exercicio", handler: function(){}, pressed: true, itemId: "desvincular" })
    }
  }
})
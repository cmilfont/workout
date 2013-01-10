Ext.define("Workout.view.exercicios.Grid", {
  extend: "Ext.grid.Panel",
  alias: ["widget.exerciciogrid"],
  mixins: {
    crud: "Workout.view.exercicios.Crud"
  },
  columns: [
    {text: "Título", dataIndex: "titulo"},
    {text: "Descrição", dataIndex: "descricao"}
  ],
  selModel: {
    allowDeselect: true
  },
  initComponent: function() {
    this.tbar = [
      { text: "Cadastrar", handler: this.abrirJanela, scope: this},
      { text: "Editar", handler: this.abrirJanela, scope: this}
    ];
    this.callParent();
  },
  store: Ext.createByAlias("store.exercicios")
});
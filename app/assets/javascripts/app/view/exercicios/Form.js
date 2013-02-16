Ext.define("Workout.view.exercicios.Form", {
  extend: "Ext.form.Panel",
  alias: ["widget.exercicioform"],
  frame: true,
  items: [
    {xtype: "hidden",  name: "id"},
    {xtype: "textfield", fieldLabel: "Título", name: "titulo"},
    {xtype: "textfield", fieldLabel: "Descrição", name: "descricao"}
  ],
  salvar: function() {
    var form = this.getForm();
    var json = form.getValues();
    var model = form.getRecord();
    if( model ) {
      model.set(json);
    } else {
      model = Ext.create("Workout.model.Exercicio", json);
    }
    model.save({
      success: function(record, operation) {
        this.fireEvent('salvo', model);
      },
      scope: this
    });
  },
  initComponent: function() {
    this.buttons = [ 
      this.SalvarButton = Ext.create("Ext.button.Button", {text: "Salvar"})
    ];
    this.callParent();
    this.SalvarButton.setHandler(this.salvar, this);
    if( this.exercicio )
      this.getForm().loadRecord( this.exercicio );
  }
});
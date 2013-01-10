Ext.define("Workout.view.exercicios.Form", {
  extend: "Ext.form.Panel",
  alias: ["widget.exercicioform"],
  frame: true,
  items: [
    {xtype: "hidden",  name: "id"},
    {xtype: "textfield", fieldLabel: "Título", name: "titulo"},
    {xtype: "textfield", fieldLabel: "Descrição", name: "descricao"}
  ],
  initComponent: function() {
    this.callParent();
    if( this.exercicio )
      this.getForm().loadRecord( this.exercicio );
  },
  callbackSave: Ext.emptyFn,
  buttons: [
    { 
      text: "Salvar", 
      handler: function() {
        var panel = this.up("exercicioform");
         var form = panel.getForm();
         var json = form.getValues();
         var model = Ext.create("Workout.model.Exercicio", json);
         model.save({
           callback: function() {
             panel.callbackSave.call(panel.callbackSaveScope || panel,
                                      model)
           }
         })
      }
    }
  ]
});
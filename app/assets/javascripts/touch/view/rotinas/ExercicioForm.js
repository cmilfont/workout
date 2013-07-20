Ext.define('Workout.view.rotinas.ExercicioForm', {
  extend: 'Ext.form.Panel',
  alias: 'widget.rotinaexercicioform',
  formBind: true,
  vincular: function() {
    Ext.create("Workout.model.Item", this.getForm().getValues() )
       .save({
          callback: function(model, operation){
            this.fireEvent("vinculado", operation.resultSet.records[0]);
          },
          scope: this
        });
  },
  initComponent: function(){
    this.buttons = [{text: "Vincular", handler: this.vincular, scope: this, formBind: true}];
    this.callParent();
    this.getForm().loadRecord(this.item);
  },
  items: [
    { 
       name: 'exercicio_id',
       xtype: 'combo', 
       fieldLabel: 'Exercício', 
       displayField: 'titulo',
       valueField: 'id',
       allowBlank: false,
       blankText: "Campo obrigatório",
       queryMode: 'remote',
       store: Ext.createByAlias('store.exercicios')
    },
    { xtype: 'textfield', fieldLabel: "Repetições", name: "repeticao"},
    { xtype: 'textfield', fieldLabel: "Tempo", name: "tempo"},
    { xtype: "hidden", name: "rotina_id"},
    { xtype: "hidden", name: "id"}
  ]
});
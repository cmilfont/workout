Ext.define('Workout.view.rotinas.ExercicioForm', {
  extend: 'Ext.form.Panel',
  alias: 'widget.rotinaexercicioform',
  formBind: true,
  vincular: function() {
    var formPanel = this;
    var item = Ext.create("Workout.model.Item", this.getForm().getValues() )
    item.save({
      callback: function(){
        formPanel.fireEvent("vinculado", item);
      }
    });
  },
  initComponent: function(){
    this.buttons = [{text: "Vincular", handler: this.vincular, scope: this, formBind: true}];
    this.callParent();
    this.getForm().setValues({rotina_id: this.rotina_id} );
  },
  items: [
    { 
       name: 'exercicio_id',
       xtype: 'combo', 
       fieldLabel: 'Exercício', 
       displayField: 'titulo',
       valueField: 'id',
       allowBlank: false,
       store: Ext.createByAlias('store.exercicios')
    },
    { xtype: 'textfield', fieldLabel: "Repetições", name: "repeticao"},
    { xtype: 'textfield', fieldLabel: "Tempo", name: "tempo"},
    { xtype: "hidden", name: "rotina_id"}
  ]
});
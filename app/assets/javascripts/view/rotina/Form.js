//1 - adicionar um hidden no form para o id
//2 - passar um model na config do form e setar no Basic com loadRecod
//3 - quando clicar no save, pegar o model original via getRecord
//4 - save e quando terminar, atualizar o item na tree

Ext.define('Workout.view.rotina.Form', {
  extend: 'Ext.form.Panel',
  alias: 'widget.rotinaform',
  formBind: true, 
  frame:true,
  salvarCallback: Ext.emptyFn,
  scopeSalvarCallback: null,
  model: null,
  constructor: function(config) {
    this.callParent(arguments);
    if(config.model) this.getForm().loadRecord(config.model);
  },
  items: [
    {xtype: "hiddenfield", name: "id"},
    {name: "titulo", xtype: "textfield", fieldLabel: "Titulo", allowBlank: false }
  ],
  buttons: [{ text: "Salvar", formBind:true, handler: function(){
      var panel = this.up("form");
      var form = panel.getForm();
      if( form.isValid() ) {
        panel.salvarCallback.call( panel.scopeSalvarCallback, form.getValues() );
      }
  }}]
});
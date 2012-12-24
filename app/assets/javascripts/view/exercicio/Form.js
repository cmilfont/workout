Ext.define('Workout.view.exercicio.Form', {
  extend: 'Ext.form.Panel',
  alias: 'widget.exercicioform',
  formBind: true, 
  salvarCallback: Ext.emptyFn,
  scopeSalvarCallback: null,
  model: null,
  constructor: function(config) {
    this.callParent(arguments);
    if(config.model) this.getForm().loadRecord(config.model);
  },
  items: [
    {xtype: "hiddenfield", name: "id"},
    {xtype: "exerciciocombo"}
  ],
  buttons: [{ text: "Salvar", formBind:true, handler: function(){
      var panel = this.up("form");
      var form = panel.getForm();
      if( form.isValid() ) {
        panel.salvarCallback.call( panel.scopeSalvarCallback, form.getValues() );
      }
  }}]
  
});

Ext.define('Workout.view.rotina.Form', {
  extend: 'Ext.form.Panel',
  alias: 'widget.rotinaform',
  formBind: true, 
  frame:true,
  salvarCallback: Ext.emptyFn,
  scopeSalvarCallback: null,
  items: [{name: "titulo", xtype: "textfield", fieldLabel: "Titulo", allowBlank: false }],
  buttons: [{ text: "Salvar", formBind:true, handler: function(){
      var panel = this.up("form");
      var form = panel.getForm();
      if( form.isValid() ) {
          var model = Ext.create('Workout.model.Rotina', form.getValues());
          model.save({ 
            callback: function(rec){ 
              console.log("SAlvou", rec); 
              //panel.salvarCallback(model);
              panel.salvarCallback.call( panel.scopeSalvarCallback, model )
            } 
          })
      }
  }}]
});
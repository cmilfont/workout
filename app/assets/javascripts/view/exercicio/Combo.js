Ext.define("Workout.view.exercicio.Combo", {
  extend: 'Ext.form.field.ComboBox', 
  alias: ["widget.exerciciocombo"],
  name: "exercicio_id",
  displayField: 'titulo',
  valueField: 'id',
  fieldLabel: 'Exercício',
  store: { model: "Workout.model.Exercicio" },
  template: '<div>{titulo} - <a data-id="{id}">editar</a> </div>',
  setupListConfig: function() {
    var combo = this;
    return {
      getInnerTpl: function() {
        return combo.template;
      },
      listeners: {
        el: {
          click: function(evento, el) {
            var id = evento.getTarget().getAttribute("data-id");
            console.log("Id dele: ", id);
            return false;
          }
        }
      }
    };
  },
  initComponent: function() {
    this.listConfig = this.setupListConfig();
    this.callParent();
  },
});
Ext.define('Workout.controller.Dashboard', {
  extend: 'Ext.app.Controller',
  loadController: function(button) {
    if(button.controller) {
      var pasta = button.controller.toLowerCase();
      var controller = Workout.getApplication().getController( button.controller );
      controller.init(button);
      //Ext.create(controller.getView( pasta + ".Window"));
    }
  },
  init: function() {
    this.control({
      "#exercicios": {
        scope: this,
        click: this.loadController
      },
      "#rotinas" : {
        click: {
          scope: this,
          fn: this.loadController
        }
      },
    });
  }
});
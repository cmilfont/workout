Ext.define('Workout.controller.Dashboard', {
  extend: 'Ext.app.Controller',
  loadController: function(button) {
    if(button.controller) {
      Workout.getApplication()
             .getController( button.controller )
             .init(button);
    }
  },
  init: function() {

    this.control({
      "#exercicios": {
        click: this.loadController
      },
      "#rotinas" : {
        click: this.loadController
      }
    });
    
  }
});
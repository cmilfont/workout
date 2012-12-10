Ext.define('Workout.controller.Dashboard', {
  extend: 'Ext.app.Controller',
  init: function() {
    this.control({
      "button[itemId='treinos']": {
        click: {
          scope: this,
          fn: this.onTabAdd
        }
      }
    });
  },

  onTabAdd: function(button) {
    this.getTabPanel().addTab(button.text, button.viewModel);
  }
  
  , getTabPanel: function() {
    return Ext.ComponentQuery.query("tabpanel[itemId='tabs']")[0];
  }
  
});
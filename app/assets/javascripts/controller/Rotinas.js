Ext.define('Workout.controller.Rotinas', {
  extend: 'Ext.app.Controller',
  views: ['rotina.List', 'rotina.Form'],
  models: ['Rotina', 'Item', 'Exercicio'],
  init: function() {
    this.control({
      "button[itemId='rotinas']": {
        click: {
          scope: this,
          fn: this.onTabAdd
        }
      },
      
      "rotinalist[itemId='tab-Rotinas']": {
        afterrender: function(view) {
          //view.store.load();
          //view.refresh();
        }
      }
    });
  },
  
  onTabAdd: function(button) {
    this.getTabPanel().addTab({
      title: button.text,
      itemId: "tab-" + button.text,
      closable: true,
      xtype: "rotinalist"
    });
  }
  
  , getTabPanel: function() {
    return Ext.ComponentQuery.query("tabpanel[itemId='tabs']")[0];
  }
  
    
});
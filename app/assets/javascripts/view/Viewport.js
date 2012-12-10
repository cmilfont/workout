Ext.define('Workout.view.Viewport', {
  extend: 'Ext.container.Viewport',
  layout: 'border',
  requires: ['Workout.view.DashboardTabPanel', 'Workout.view.DashboardToolbar'],
  style: {
    backgroundColor: "#3C8FC0"
  },
  initComponent: function() {
    this.items = [
      { region: 'north', xtype: 'dtoolbar' },
      { region: 'center', xtype: 'dtabpanel' }
    ];
    this.callParent();
  }
});
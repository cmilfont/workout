Ext.define('Workout.view.Viewport', {
  extend: 'Ext.container.Viewport',
  layout: 'border',
  requires: ['Workout.view.DashboardTabPanel', 
             'Workout.view.DashboardToolbar'],
  items: [
      { region: 'north', xtype: 'dtoolbar' },
      { region: 'center', xtype: 'dtabpanel' }
    ]
})
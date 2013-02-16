Ext.define('Workout.view.Viewport', {
  extend: 'Ext.container.Viewport',
  layout: 'border',
  requires: ['Workout.view.dashboard.TabPanel', 
             'Workout.view.dashboard.Toolbar'],
  items: [
      { region: 'north', xtype: 'dtoolbar' },
      { region: 'center', xtype: 'dtabpanel' }
    ]
})
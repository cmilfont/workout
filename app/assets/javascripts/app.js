Ext.application({
  name: 'Workout',
  paths: {"Ext.ux":"/assets/ux"},
  requires: ['Ext.ux.RowExpander'],
  appFolder: '/assets',
  autoCreateViewport: true,
  controllers: ['Rotinas']
});

//Ext.Loader.setPath("Ext.ux", "/assets/ux");
//Ext.require('Ext.ux.RowExpander');
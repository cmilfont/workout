Ext.application({
  name: "Workout",
  paths: {"Ext.ux":"/assets/ux"},
  requires: [
    'Ext.ux.RowExpander'
  ],
  appFolder: "/assets/app",
  autoCreateViewport: true,
  controllers: ['Dashboard'],
  init: function(application){
    Workout.getApplication = function() { return application; };
  }
});
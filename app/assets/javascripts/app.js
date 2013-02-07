Ext.application({
  name: "Workout",
  appFolder: "/assets",
  autoCreateViewport: true,
  controllers: ['Exercicios', 'Rotinas'],
  init: function(application){
    Workout.getApplication = function() { return application; };
  }
});
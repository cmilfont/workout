Ext.onReady(function(){
	
	Ext.Ajax.extraParams = {
		authenticity_token : Ext.select("meta[name='csrf-token']").first().getAttribute('content')
	}

  // Ext.Ajax.on('requestexception', function (conn, response, options) {
  //   if (response.status === 401 || response.status === 401) {
  //     resp = JSON.parse(response.responseText)
  //     Ext.Msg.alert('Erro', resp.message);
  //   }
  // });

});

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
Ext.define('Workout.view.DashboardTabPanel', {
  alias: 'widget.dtabpanel',
  extend: 'Ext.tab.Panel',
  itemId: "tabs",
  frame: true,
  style: {
    backgroundColor: "#3C8FC0"
  },
  activeTab: 0,
  items: [{
    title: 'Dashboard',
    html: 'The first tab\'s content. Others may be added dynamically'
  }],
  
  addTab: function(panel) {
    var tab = this.down("[itemId='tab-" + panel.title + "']");
    if(!tab) tab = this.add(panel);
    this.setActiveTab(tab);
  }
});
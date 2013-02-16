Ext.define('Workout.view.dashboard.TabPanel', {
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
    xtype: "panel",
    html: 'Dashboard com os dados do usuaário'
  }],
  
  addTab: function(panel) {
    var tab = this.down("[itemId='tab-" + panel.title + "']");
    if(!tab) tab = this.add(panel);
    this.setActiveTab(tab);
  }
});
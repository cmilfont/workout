Ext.define('Workout.view.rotina.List', {
  extend: 'Ext.view.View',
  alias: 'widget.rotinalist',
  tpl: new Ext.XTemplate(
      '<tpl for=".">',
          '<div style="margin-bottom: 10px;" class="thumb-wrap">',
            '<img src="{src}" />',
            '<br/><span>{caption}</span>',
          '</div>',
      '</tpl>'
  ),
  itemSelector: 'div.thumb-wrap',
  emptyText: 'No images available',
  store: Ext.create("Workout.store.RotinaStore"),
  initComponent: function() {
    this.callParent(arguments);
    console.log("Init");
  }
});
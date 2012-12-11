Ext.define('Workout.view.rotina.List', {
  extend: 'Ext.view.View',
  alias: 'widget.rotinalist',
  tpl: new Ext.XTemplate(
      '<tpl for=".">',
          '<div style="margin-bottom: 10px;" class="rotina-wrap">',
            '<span>{titulo}</span>',
          '</div>',
      '</tpl>'
  ),
  itemSelector: 'div.rotina-wrap',
  emptyText: 'Sem rotinas criadas',
  store: Ext.create("Workout.store.RotinaStore"),
  initComponent: function() {
    this.callParent(arguments);
    console.log("Init");
  }
});
Ext.define('Workout.view.dashboard.Toolbar', {
  alias: 'widget.dtoolbar',
  extend: 'Ext.toolbar.Toolbar',
  style: {
    backgroundColor: "#3C8FC0"
  },
  items: [
    { xtype: 'tbtext', text: 'Workout', cls: 'home_title' },
    '->',
    { xtype: 'button', overCls: 'home_menu_over', cls: 'home_menu', pressedCls: "home_pressed", 
      text: 'Rotinas', 
      itemId: 'rotinas',
      controller: 'Rotinas'
    },
    { xtype: 'button', overCls: 'home_menu_over', cls: 'home_menu', pressedCls: "home_pressed", text: 'Treinos', itemId: 'treinos'},
    { xtype: 'button', overCls: 'home_menu_over', cls: 'home_menu', pressedCls: "home_pressed", 
      text: 'Exercícios', 
      itemId: 'exercicios',
      controller: 'Exercicios'
    },
    {
      xtype: 'splitbutton',  overCls: 'home_split_over', cls: 'home_split', text : 'Perfil',
      menu: {
        items: [
          {text: 'Item 1', handler: function(){ alert("Item 1 clicked"); }},
          {text: 'Item 2', handler: function(){ alert("Item 2 clicked"); }}
        ]
      }
    },
    { xtype: 'tbspacer', width: 50 }
  ]
});
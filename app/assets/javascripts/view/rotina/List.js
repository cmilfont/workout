Ext.define('Workout.view.rotina.List', {
  extend: 'Ext.grid.Panel',
  alias: 'widget.rotinalist',
  store: Ext.create("Workout.store.RotinaStore"),
  columns: [
    { text: 'Rotina',  dataIndex: 'titulo' }
  ],
  selModel: {
    allowDeselect: true
  },
  tbar: [
    { xtype: 'button', text: 'Cadastrar' , pressed: true},
    { xtype: 'button', text: 'Editar', itemId: 'editar', disabled: true, pressed: true },
    { xtype: 'button', text: 'Excluir', itemId: 'excluir', disabled: true, pressed: true }
  ],
  
  cabecalhoTpl : new Ext.XTemplate('<div class="itens" >' +
        '<div class="x-combo-list-item clientes-id-combo">id</div>' +
        '<div class="x-combo-list-item clientes-cnpj-combo">CNPJ/CPF</div>' +
        '<div class="x-combo-list-item clientes-nome-combo">Razão Social</div>' +
        '<div class="x-combo-list-item clientes-nome-combo">Nome Fantasia</div>' +
        '<div style="clear: both;"> </div>' +
  '</div>').compile(),
  
  
  desabilitarBotoesAoDeselecionar: function(selectionModel, models) {
      if(models.length == 0) {
        this.down("#editar").disable();
        this.down("#excluir").disable();
      } else {
        this.down("#editar").enable();
        this.down("#excluir").enable();
      }
  },
  expandirLinhas: function() {
    var plugin = this.getPlugin('expandplugin');
    this.getStore().each( plugin.toggleRow, plugin );
  },
  
  itemTemplate: new Ext.XTemplate('<tpl for="."> <div class="itens">' +
        '<div class="x-combo-list-item itens-id">{id}</div>' +
        '<div class="x-combo-list-item itens-exercicio">{[this.getExercicio(values)]}</div>' +
        '<div class="x-combo-list-item itens">{titulo}</div>' +
        '<div class="x-combo-list-item itens"></div>' +
        '<div style="clear: both;"> </div>' +
  '</div></tpl>', {
    getExercicio: function(json) {
      var model = store.findRecord("id", json.id);
      console.log(model)
      return "Teste";
    }
  }).compile(),
  
  criarPlugin: function(store) {
    this.plugins = [{
      pluginId: 'expandplugin',
      ptype: 'rowexpander',
      expandOnDblClick: false,
      rowBodyTpl :  new Ext.XTemplate('<tpl for="."> <div class="itens">' +
            '<div class="x-combo-list-item itens-id">{id}</div>' +
            '<div class="x-combo-list-item itens-exercicio">{[this.getExercicio(values)]}</div>' +
            '<div class="x-combo-list-item itens">{titulo}</div>' +
            '<div class="x-combo-list-item itens"></div>' +
            '<div style="clear: both;"> </div>' +
      '</div></tpl>', {
        getExercicio: function(json) {
          var model = store.findRecord("id", json.id);
          console.log(model)
          return "Teste";
        }
      })
    }]
  },
  constructor: function() {
    this.criarPlugin(this.getStore());
    this.callParent(arguments);
  },
  initComponent: function() {
    this.callParent(arguments);
    this.addListener("selectionchange", this.desabilitarBotoesAoDeselecionar, this);
    this.store.load({scope: this, callback: this.expandirLinhas})
  }
});
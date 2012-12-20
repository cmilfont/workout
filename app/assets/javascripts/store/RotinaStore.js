Ext.define('Workout.store.RotinaStore', {
  alias: 'store.rotinastore',
  extend: 'Ext.data.TreeStore',
  model: "Workout.model.RotinaTree",
  root: "Workout.model.Rotina",
  constructor: function() {
    this.callParent(arguments);
    this.on({
       beforeappend: this.transformarFolha,
       append: this.adicionarItensExpandindo,
       scope: this
     });
  },   
  transformarFolha: function(root, node){
     if( node.itens().count() == 0 && node.get("id")) node.set("leaf", true);
  },
  adicionarItensExpandindo: function(root, node){
     if( node.itens().count() > 0 ){
        node.itens().each( this.adicionarItem, node);
        node.expand()
     }
   },
   adicionarItem: function(item){
      this.appendChild({
         leaf: true,
         exercicio: item.exercicio().get("titulo")
      })
   }
});
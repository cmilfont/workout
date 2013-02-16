Ext.define("Workout.view.exercicios.Window", {
  extend: "Ext.window.Window",
  alias: ["widget.exerciciowindow"],
  initComponent: function() {
    var boundary = this.boundary;
    if(boundary) {
      this.renderTo = boundary.el.dom;
      this.constrain = true;
      this.on({
        show: boundary.mask,
        close: boundary.unmask,
        scope: boundary
      });
    }
    this.callParent();
  }
})
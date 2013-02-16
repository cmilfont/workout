Ext.onReady(function(){

  Ext.Ajax.extraParams = {
    authenticity_token: Ext.select("meta[name='csrf-token']").first().getAttribute('content')
  }
  
  
  Ext.override(Ext.data.proxy.Rest, {
    constructor: function() {
      this.callParent(arguments);
      this.on("exception", function(proxy, response, operation, opts) {
        var errors    = new Ext.data.Errors(),
	          exception = Ext.JSON.decode(response.responseText).errors;
	          
        for(var item in exception) {
          errors.add({
              field  : item,
              message: exception[item]
          });
        }
        if(operation.scope.getForm) {
          var form = operation.scope.getForm();
          var model = operation.scope.getForm().getRecord();
          if(model) model.errors = errors;
          operation.scope.getForm().markInvalid(errors);
        }
      });
    }
  });
  

	Ext.override(Ext.form.field.Picker, {

	    initEvents: function() {
	        var me = this;
	        me.callParent();

	        me.keyNav = Ext.create('Ext.util.KeyNav', me.inputEl, {
  				pageDown: function() {
  	                if (!me.isExpanded) { me.onTriggerClick(); }
  	            },
  	            esc: me.collapse,
  	            scope: me,
  	            forceKeyDown: true
  	        });

	    }

	});
  
  Ext.override(Ext.form.Panel, {
		findActivedInput : function() {

			return this.getForm().getFields().filterBy(function(object, key){
				return object.isVisible() ;
			});

		},
		previousFocus : function(component) {
			var collection = this.findActivedInput();
			var current = component;

			if (!current) {
				collection.each(function(input) {
					if (input.hasFocus) current = input;
				});
			}

			var previous = collection.getAt(collection.indexOf(current) - 1);

			if (current.beforeBlur) {
				current.beforeBlur();
			}
			if(previous) {
				if(previous.xtype === "radiogroup" || previous.xtype === "checkboxgroup") {
					previous.items.get(0).focus(false);
				} else {
					previous.focus(true);
				}
			}
		},
		nextFocus : function(component, event) {
			var collection = this.findActivedInput();
			var current = component;

			if (!current) {
				collection.each(function(input) {
					if (input.hasFocus) current = input;
				});
			}
			var next = collection.getAt(collection.indexOf(current) + 1);

			if (current.beforeBlur) {
				current.beforeBlur();
			}
			if(next) {
				if(next.xtype === "radiogroup" || next.xtype === "checkboxgroup") {
					next.items.get(0).focus(true);
				} else {
					next.focus(false);
				}
			}
		}
  });
  
  Ext.override(Ext.form.field.Base, {
    initComponent: function() {
      this.callOverridden(arguments);
      this.addListener("afterrender", function(field) {

				var nav = new Ext.KeyNav(this.el, {
					'enter' : function(e) {
					  field.up("form").nextFocus(field);
					},
					'down' : function(e) {
					  field.up("form").nextFocus(field);
					},
					'up' : function(e) {
					  field.up("form").previousFocus(field);
					}
				});


      })
    }
  });
  
});
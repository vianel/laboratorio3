Ext.onReady(function() {
	
	Ext.QuickTips.init();
	Ext.define('App.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelempleados').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					Ext.Msg.alert('Pronto','En construccion');
				}
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
				handler:function() {
					Ext.Msg.alert('Pronto','En construccion');
				}
				}]
			}];
			this.callParent();
		}
	});
Ext.define('Siaco.view.Producto', {
		extend: 'App.MiPanel',
		xtype: 'productoview',
		alias: 'widget.panelproductos',
		id: 'panelproductos',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Tipo',
				xtype: 'combobox',
				name: 'tipo',
				id: 'tipo'
			},{
		         text: '...',
		         xtype: 'button',
		         id: 'catalogotipoproductos',
		         x: 260,
		         y: -27,
		        handler:function() {
					vernuevotipoproducto();
					}
			},{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombre'
			},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			},{
				fieldLabel: 'Stock minimo',
				xtype: 'textfield',
				name: 'stockminimo',
				id: 'stockminimo'
			},{
				fieldLabel: 'Stock Maximo',
				xtype: 'textfield',
				name: 'stockmaximo',
				id: 'stockmaximo'
		
			}
			];
			this.callParent();
			Ext.getCmp('tipo').focus();
		}
	});
}); //FIN DEL ONREADY
function vernuevotipoproducto() {
Ext.create('Ext.window.Window',{
		    		items: [
		    			{
		    				xtype: 'tipoproductoview'
		    			}
		    		],
		    		autoScroll: true,
		    		maxHeight: 600
		    	}).show()
}
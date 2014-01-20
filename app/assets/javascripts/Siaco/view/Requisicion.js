var ventana = null;
var ventana2 = null;
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
Ext.define('Siaco.view.Requisicion', {
		extend: 'App.MiPanel',
		xtype: 'requisicionview',
		alias: 'widget.mipanelrequisiciones',
		id: 'mipanelrequisiciones',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Producto',
				xtype: 'combobox',
				name: 'producto',
				id: 'producto'
			},{
		         text: '...',
		         xtype: 'button',
		         id: 'catalogoproductos',
		         x: 260,
		         y: -27,
		        handler:function() {
					vernuevoproducto();
					}
			},{
				
				fieldLabel: 'Fecha',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fecha',
				id: 'fecha'
			},{
				fieldLabel: 'Cantidad',
				xtype: 'textfield',
				name: 'cantidad',
				id: 'cantidad'
			}
			
			];
			this.callParent();
			Ext.getCmp('producto').focus();
		}
	});
	
	


}); //FIN DEL ONREADY

function vernuevoproducto(){
Ext.create('Ext.window.Window',{
		    		items: [
		    			{
		    				xtype: 'productoview'
		    			}
		    		],
		    		autoScroll: true,
		    		maxHeight: 600
		    	}).show()
}


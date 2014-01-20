var tabs = null;
var ventana = null;
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
						Ext.getCmp('mipanelsanciones').getForm().reset();
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
Ext.define('Siaco.view.Sancion', {
		extend: 'App.MiPanel',
		xtype: 'sancionview',
		alias: 'widget.mipanelsanciones',
		id: 'mipanelsanciones',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Inmueble',
				xtype: 'combobox',
				name: 'inmueble',
				id: 'inmueble'
			},{
				fieldLabel: 'Tipo Sancion',
				xtype: 'combobox',
				name: 'tiposancion',
				id: 'tiposancion'
			},{
		         text: '...',
		         xtype: 'button',
		         id: 'catalogotiposancion',
		         x: 260,
		         y: -27,
		        handler:function() {
					vernuevotiposancion();
					}
			},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			},{
				fieldLabel: 'Fecha Realizacion',
				xtype: 'datefield',
				name: 'fecharealizacion',
				id: 'fecharealizacion'
			},{
				fieldLabel: 'Condicion',
				xtype: 'textfield',
				name: 'condicion',
				id: 'condicion'
			}
			
			];
			this.callParent();
			Ext.getCmp('inmueble').focus();
		}
	});
	

}); //FIN DEL ONREADY

function vernuevotiposancion(){
	Ext.create('Ext.window.Window',{
		    		items: [
		    			{
		    				xtype: 'tiposancionview'
		    			}
		    		],
		    		autoScroll: true,
		    		maxHeight: 600
		    	}).show()
}
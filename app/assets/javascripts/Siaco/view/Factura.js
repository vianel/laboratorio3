var tabs = null;
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
						Ext.getCmp('mipanelfacturas').getForm().reset();
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
			App.MiPanel.superclass.initComponent.call(this);
		}
	});
Ext.define('Siaco.view.Factura', {
		extend: 'App.MiPanel',
		xtype: 'facturaview',
		alias: 'widget.mipanelfacturas',
		id: 'mipanelfacturas',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Condominio',
				xtype: 'combobox',
				name: 'condominio',
				id: 'condominio'
			},{
				fieldLabel: 'Sub-total',
				xtype: 'textfield',
				name: 'subtotal',
				id: 'subtotal'
			},{
				fieldLabel: 'IVA',
				xtype: 'textfield',
				name: 'iva',
				id: 'iva'
			}
			
			];
			this.callParent()
			Ext.getCmp('condominio').focus();
		}
	});
}); //FIN DEL ONREADY
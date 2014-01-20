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
						Ext.getCmp('mipanelrequisiciones').getForm().reset();
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
Ext.define('Siaco.view.TipoProducto', {
		extend: 'App.MiPanel',
		xtype: 'tipoproductoview',
		alias: 'widget.paneltipoproductos',
		id: 'paneltipoproductos',
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
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombre'
			},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			}
			];
			this.callParent();
			Ext.getCmp('condominio').focus();
		}
	});
}); //FIN DEL ONREADY
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

Ext.define('Siaco.view.TipoNovedad', {
		extend: 'App.MiPanel',
		xtype: 'tiponovedadview',
		alias: 'widget.paneltiponovedad',
		id: 'paneltiponovedad',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
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
				fieldLabel: 'Condominio',
				xtype: 'combobox',
				name: 'condominio',
				id: 'condominio'
			}
			];
			this.callParent();
			Ext.getCmp('nombre').focus();
		}
	});
});
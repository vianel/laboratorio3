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
Ext.define('Siaco.view.TipoSancion', {
		extend: 'App.MiPanel',
		xtype: 'tiposancionview',
		alias: 'widget.paneltiposancion',
		id: 'paneltiposancion',
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
			},{
				fieldLabel: 'Monto',
				xtype: 'textfield',
				name: 'monto',
				id: 'monto'
			},{
				fieldLabel: 'Penalizacion',
				xtype: 'textfield',
				name: 'penalizacion',
				id: 'penalizacion'
			}
			];
			this.callParent();
			Ext.getCmp('condominio').focus();
		}
	});
}); //FIN DEL ONREADY
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
						Ext.getCmp('mipanelsugerencia').getForm().reset();
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
Ext.define('Siaco.view.Sugerencia', {
		extend: 'App.MiPanel',
		xtype: 'sugerenciaview',
		alias: 'widget.mipanelsugerencias',
		id: 'mipanelsugerencias',
		title: 'Panel Sugerencia',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			}
			
			];
			this.callParent();
		}
	});
	
}); //FIN DEL ONREADY
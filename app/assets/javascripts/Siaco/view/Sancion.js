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
		title: 'Sancionar',
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
				fieldLabel: 'Monto',
				xtype: 'textfield',
				name: 'monto',
				id: 'monto'
			}
			
			];
			this.callParent();
			Ext.getCmp('inmueble').focus();
		}
	});
	

}); //FIN DEL ONREADY


var tabs = null;
var arregloareacomun = ['Caney de fiestas','Piscina'];
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
						Ext.getCmp('mipanelreservaciones').getForm().reset();
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
Ext.define('Siaco.view.Reservacion', {
		extend: 'App.MiPanel',
		xtype: 'reservacionview',
		alias: 'widget.mipanelreservaciones',
		id: 'mipanelreservaciones',
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
				fieldLabel: 'Area Comun',
				xtype: 'combobox',
				name: 'areacomun',
				id: 'areacomun',
				store: arregloareacomun
			},{
				fieldLabel: 'Fecha de Reservacion',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechareservacion',
				id: 'fechareservacion'
			},{
				fieldLabel: 'Fecha de Inicio',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechainicio',
				id: 'fechainicio'
			},{
				fieldLabel: 'Fecha de Finalizacion',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechafinalizacion',
				id: 'fechafinalizacion'
			}
			
			];
			this.callParent();
			Ext.getCmp('inmueble').focus();
		}
	});

}); //FIN DEL ONREADY
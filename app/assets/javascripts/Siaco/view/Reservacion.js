var tabs = null;
//var arregloareacomun = Ext.create('Siaco.store.Areascomunes');
Ext.onReady(function() {
	

	Ext.QuickTips.init();



//var storeareacomun = Ext.getStore('areascomunesStore');
//	storeareacomun.sync();
		Ext.define('Siaco.view.MiPanel', {
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
					Ext.Msg.alert('Pronto',storeareacomun[0]);
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
		extend: 'Siaco.view.MiPanel',
		xtype: 'reservacionview',
		alias: 'widget.mipanelreservaciones',
		id: 'mipanelreservaciones',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Area Comun',
				xtype: 'combobox',
				name: 'areacomun',
				id: 'areacomun',
				store: Ext.create('Siaco.store.Areascomunes'),
				displayField: 'nombre'
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
				fieldLabel: 'hora de Inicio',
				xtype: 'timefield',
				name: 'horainicio',
				minValue: '6:00 AM',
        		maxValue: '8:00 PM',
				id: 'horainicio'
			},{
				fieldLabel: 'hora de fin',
				xtype: 'timefield',
				name: 'horafin',
				id: 'horafin'
			}
			
			];
			this.callParent();
		}
	});

}); //FIN DEL ONREADY
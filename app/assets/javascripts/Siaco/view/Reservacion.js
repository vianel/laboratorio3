var tabs = null;
//var arregloareacomun = Ext.create('Siaco.store.Areascomunes');
Ext.onReady(function() {
	

	Ext.QuickTips.init();

//Definicion del Modelo
Ext.define('Areacomun', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'nombre', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'areascomunes/buscar'
           }
});

//Definicion del Data Store
var areacomunStore = Ext.create('Ext.data.Store', {
    model: 'Areacomun',
    autoLoad: true,
});


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
			    xtype:'combobox',
                id : 'areacomun',
                fieldLabel: 'Area Comun',
                store: areacomunStore,
                valueField: 'id',
                displayField: 'nombre',   
                queryMode: 'remote',
                typeAhead: true,
                emptyText:'Seleccionar',
                triggerAction: 'all',
                selecOnFocus: true,
                listeners: {
                 scope: this,
                'select': function(combo, rec) {
                      alert(rec[0].get(combo.displayField)); 
                 }
             }
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
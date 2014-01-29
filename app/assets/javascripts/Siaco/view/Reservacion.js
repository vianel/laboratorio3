(function() {
Ext.define('Siaco.view.Reservacion', {
		extend: 'App.MiPanel',
		xtype: 'reservacionview',
		alias: 'widget.mipanelreservaciones',
		id: 'mipanelreservaciones',
		bodyPadding: 5,
		width: 450,
		
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
				var inmuebleid, form, areacomunid,fechareservacion,fechainicio,fechafinalizacion;
	                form = this.up('form');
	                areacomunid = this.up('form').down('#areacomun').getValue();
	                inmuebleid = this.up('form').down('#inmueble').getValue();
	                fechareservacion = this.up('form').down('#fechareservacion').getValue();
					fechainicio = this.up('form').down('#fechainicio').getValue();
					fechafinalizacion = this.up('form').down('#fechafinalizacion').getValue();

	                return form.fireEvent('reservacion', areacomunid, inmuebleid,fechainicio,fechafinalizacion,fechareservacion);

				}
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
				handler:function() {
					Ext.Msg.alert('Pronto','En construccion');
				}
				}]
			}];
			 return this.callParent();
		},
		
		items: [
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
			
			],
			   grabar: function() {
      				return this.trigger('reservacion');
    			}	
  });

}).call(this); //FIN DEL ONREADY

var ventanatiponovedades = null;
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
						Ext.getCmp('mipanelnovedades').getForm().reset();
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
Ext.define('Siaco.view.Novedad', {
		extend: 'App.MiPanel',
		xtype: 'novedadview',
		alias: 'widget.mipanelnovedades',
		id: 'mipanelnovedades',
		title: 'Panel Novedades',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Cedula',
				xtype: 'textfield',
				name: 'cedula',
				id: 'cedula'
			},{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombre'
			},{
				fieldLabel: 'Apellido',
				xtype: 'textfield',
				name: 'apellido',
				id: 'apellido'
			},{
				fieldLabel: 'Placa del vehiculo',
				xtype: 'textfield',
				name: 'placavehiculo',
				id: 'placavehiculo'
			},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			},{
				fieldLabel: 'Entrada',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'entrada',
				id: 'entrada',
			},{
				fieldLabel: 'Salida',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'salida',
				id: 'salida',
			},{
				fieldLabel: 'Inmueble',
				xtype: 'combobox',
				name: 'inmueble',
				id: 'inmueble'
			},{
				fieldLabel: 'Empleado',
				xtype: 'combobox',
				name: 'empleado',
				id: 'empleado'
			},{
				fieldLabel: 'Publicar',
				xtype: 'checkbox',
				name: 'publicar',
				id: 'publicar'
			},{
				fieldLabel: 'Tipo de Novedad',
				xtype: 'combobox',
				name: 'tiponovedad',
				id: 'tiponovedad'
			}, {
		         text: '...',
		         xtype: 'button',
		         id: 'catalogo',
		           iconCls: 'buscar',
		         x: 260,
		         y: -27,
		        handler:function() {
					vernuevotiponovedades();
				}
        		}
			];
			this.callParent();
			Ext.getCmp('cedula').focus();
		}
	});
}); //FIN DEL ONREADY

function vernuevotiponovedades(){
	 //Instanciamos la ventana
   	Ext.create('Ext.window.Window',{
		    		items: [
		    			{
		    				xtype: 'tiponovedadview'
		    			}
		    		],
		    		autoScroll: true,
		    		maxHeight: 600
		    	}).show()
}
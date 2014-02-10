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
						Ext.getCmp('mipanelareascomunes').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {

            Ext.Ajax.request({
             url: 'areascomunes/grabar',
			 method: 'GET',
             //Enviando los parametros a la pagina servidora
             params: {
              ajax: 'true',
              funcion: 'grabar',
              autoLoad: true,
              nombre: Ext.getCmp('nombre').getValue(), //obtiene el valor a traves del id del campo
              descripcion: Ext.getCmp('descripcion').getValue(),
              costo: Ext.getCmp('costo').getValue(),
             },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
              datos=Ext.JSON.decode(resultado.responseText);
              Ext.Msg.alert('exito', datos.msg);
             },
             //No hay retorno de la pagina servidora
             failure: function() {
              Ext.Msg.alert("Error", "Servidor no conectado!");
             }
            });
            
					//Ext.Msg.alert('Pronto','En construccion');
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
Ext.define('Siaco.view.Areacomun', {
		extend: 'App.MiPanel',
		xtype: 'areacomunview',
		alias: 'widget.mipanelareascomunes',
		id: 'mipanelareascomunes',
		title: 'Panel Area comun',
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
				fieldLabel: 'Costo',
				xtype: 'textfield',
				name: 'costo',
				id: 'costo'
			}
			
			];
			this.callParent();
		}
	});
}); //FIN DEL ONREADY
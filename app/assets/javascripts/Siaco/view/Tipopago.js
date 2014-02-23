Ext.onReady(function() {
	
	Ext.QuickTips.init();
	Ext.define('Siaco.view.MiPanelTipopagos', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('tipopago').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					guardarcontipopago();
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

Ext.define('Siaco.view.Tipopago', {
		extend: 'Siaco.view.MiPanelTipopagos',
		xtype: 'tipopagoView',
		alias: 'widget.tipopago',
		id: 'tipopago',
		title: 'Nuevotipopago',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombrecontipopago'
			},{
				fieldLabel: 'Codigo',
				xtype: 'textfield',
				name: 'codigo',
				id: 'codigocontipopago'
			}
			];
			this.callParent();
			Ext.getCmp('nombrecontipopago').focus();
		}
	});
});

   function guardarcontipopago()
   {
   		Ext.Ajax.request({
	     url: 'tipopagos/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      nombre: Ext.getCmp('nombrecontipopago').getValue(), //obtiene el valor a traves del id del campo
	      codigo: Ext.getCmp('codigocontipopago').getValue(),
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('tipopago').getForm().reset();
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
   }
var tabs = null;
Ext.onReady(function() {
	
	Ext.QuickTips.init();
		Ext.define('Siaco.view.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelfacturas').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					guardar();
				}
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
				handler:function() {
					eliminar();
				}
				}]
			}];
			this.callParent();
		}
	});
Ext.define('Siaco.view.Factura', {
		extend: 'Siaco.view.MiPanel',
		xtype: 'facturaview',
		alias: 'widget.mipanelfacturas',
		id: 'mipanelfacturas',
		title: 'Panel Factura',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel:'id',
				xtype: 'textfield',
				name: 'id',
				id: 'id'
				//disabled: true
			},{
	             text: 'buscar',
	             xtype: 'button',
	             id: 'buscar',
	               iconCls: 'buscar',
	             x: 260,
	             y: -27,
	            handler:function() {
	          		buscar();
	          		}
      		},{
				fieldLabel: 'Sub-total',
				xtype: 'textfield',
				name: 'subtotal',
				id: 'subtotal'
			},{
				fieldLabel: 'IVA',
				xtype: 'textfield',
				name: 'iva',
				id: 'iva'
			}
			
			];
			this.callParent()
			Ext.getCmp('subtotal').focus();
		}
	});
}); //FIN DEL ONREADY

   function buscar() {
           Ext.Ajax.request({
             url: 'facturas/buscar',
			 method: 'GET',
             //Enviando los parametros a la pagina servidora
             params: {
              ajax: 'true',
              funcion: 'buscar',
              id: Ext.getCmp('id').getValue()
             },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
              datos=Ext.JSON.decode(resultado.responseText);
              if (datos.exito=='true') {
               Ext.getCmp('id').setValue(datos.id);
               Ext.getCmp('subtotal').setValue(datos.subtotal);
               Ext.getCmp('iva').setValue(datos.iva);

              }
              else {
               Ext.Msg.alert("Error", datos.msg);
              }
             },
             //No hay retorno de la pagina servidora
             failure: function() {
              Ext.Msg.alert("Error", "Servidor no conectado");
             }
            });    
    
   }

   function eliminar() {
   			var loadingMask = new Ext.LoadMask(Ext.getBody(), { msg: "eliminando..." });
                 loadingMask.show();
	       Ext.Ajax.request({
	    	 url: '/facturas/eliminar',
			 method: 'GET',
	         //Enviando los parametros a la pagina servidora
	         params: {
	              ajax: 'true',
	              funcion: 'eliminar',
	              id: Ext.getCmp('id').getValue()
	         },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
			 loadingMask.hide();
              datos=Ext.JSON.decode(resultado.responseText);
              Ext.Msg.alert('Mensaje', datos.msg);
			  Ext.getCmp('mipanelfacturas').getForm().reset();
             },
             //No hay retorno de la pagina servidora
                     failure: function(f,a){
					     loadingMask.hide();
                         if (a.failureType === Ext.form.Action.CONNECT_FAILURE){
                             Ext.Msg.alert('Error', 'El servidor reporta:'+a.response.status+' '+a.response.statusText);
                         }
                         if (a.failureType === Ext.form.Action.SERVER_INVALID){
                            Ext.Msg.alert('Advertencia', a.result.errormsg);
                         }
                     }
            });



   }

   function guardar()
   {
   		Ext.Ajax.request({
	     url: 'facturas/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      subtotal: Ext.getCmp('subtotal').getValue(), //obtiene el valor a traves del id del campo
	      iva: Ext.getCmp('iva').getValue(),
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelfacturas').getForm().reset();
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
   }
var tabs = null;
var ventanacatalogoproveedores = null;
var storeF = null;
Ext.onReady(function() {
	
	Ext.QuickTips.init();

//Definicion del grid


		Ext.define('Siaco.view.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelproveedores').getForm().reset();
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
Ext.define('Siaco.view.Proveedor', {
		extend: 'Siaco.view.MiPanel',
		xtype: 'proveedorview',
		alias: 'widget.mipanelproveedores',
		id: 'mipanelproveedores',
		title: 'Panel Proveedor',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel:'rif',
				xtype: 'textfield',
				name: 'rif',
				id: 'rif',
				//disabled: true
			},{
	             text: 'buscar',
	             xtype: 'button',
	             id: 'buscar',
	               iconCls: 'buscar',
	             x: 260,
	             y: -27,
	            handler:function() {
	          		//buscar(); USAR PARA BUSCAR USANDO LA CAJA DE TEXTO
	          		catalogoproveedores();
	          		}
      		},{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombre'
			},{
				fieldLabel: 'Direccion',
				xtype: 'textarea',
				name: 'direccion',
				id: 'direccion'
			},{
        fieldLabel: 'Telefono',
        xtype: 'textfield',
        name: 'telefono',
        id: 'telefono'
      },{
        fieldLabel: 'Email',
        xtype: 'textfield',
        name: 'email',
        id: 'email'
      },{
        fieldLabel: 'celular',
        xtype: 'textfield',
        name: 'celular',
        id: 'celular'
      }
			
			];
			this.callParent()
			Ext.getCmp('rif').focus();
		}
	});
}); //FIN DEL ONREADY
	function modificar()
	{
		 		Ext.Ajax.request({
	     url: 'proveedores/modificar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'modificar',
	      id: Ext.getCmp('id').getValue(),
	      subtotal: Ext.getCmp('subtotal').getValue(), //obtiene el valor a traves del id del campo
	      iva: Ext.getCmp('iva').getValue(),
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelProveedors').getForm().reset();
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
	}


   function eliminar() {
   			var loadingMask = new Ext.LoadMask(Ext.getBody(), { msg: "eliminando..." });
                 loadingMask.show();
	       Ext.Ajax.request({
	    	 url: '/proveedores/eliminar',
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
			  Ext.getCmp('mipanelProveedors').getForm().reset();
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
	     url: 'proveedores/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      rif: Ext.getCmp('rif').getValue(), //obtiene el valor a traves del id del campo
	      nombre: Ext.getCmp('nombre').getValue(),
        direccion: Ext.getCmp('direccion').getValue(),
        telefono: Ext.getCmp('telefono').getValue(),
        email: Ext.getCmp('email').getValue(),
        celular: Ext.getCmp('celular').getValue(),
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelproveedores').getForm().reset();
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
   }


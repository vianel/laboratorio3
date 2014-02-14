var tabs = null;
var ventanacatalogofacturas = null;
var storeF = null;
Ext.onReady(function() {
	
	Ext.QuickTips.init();

//Definicion del grid

Ext.define('Siaco.view.FacturasGrid', {
    extend: 'Ext.grid.Panel',
    store: Ext.create('Siaco.store.Facturas'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.facturasgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', sortable: false},
            {text: "id", dataIndex: 'id', sortable: true},
            {text: "subtotal",  dataIndex: 'subtotal', sortable: true},
            {text: "iva", dataIndex: 'iva', sortable: true},
            {text: "status",  dataIndex: 'status', sortable: true},
    
        ];
        this.dockedItems = [ {
    xtype: 'toolbar',
    dock: 'bottom',
    items: [

     { xtype: 'button',
                    text: 'Aceptar',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       if (data!=null) {
                    	 Seleccionarfactura();
                       }
                       else {
                        alert("No ha seleccionado un item.");
                       }
                      }
                    }
                },
                {
                    xtype: 'button',
                    text: 'Salir',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       ventanacatalogofacturas.close();
                      }
                    }
                }
    ]
  } ];
        // Origen de los datos, de un data store
        //this.store = facturasStore;
    //   this.store = Ext.getStore('facturasStore')
      //  this.forceFit = true;

       storeF = Ext.getStore('facturasStore')
      //  storeF.add(factura)
       storeF.sync()
     //   this.store = storeF
        this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                            	data = this.getSelectionModel().selected.items[0].data;
                            	if (data!=null) {
                               	 Seleccionarfactura();
                                }
                            }
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});

Ext.define('miventanacatalogofacturas', {
    extend: 'Ext.window.Window',

                layout      : 'absolute',
                width       : 420,
                height      : 200,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : false,
                maximizable : true,
                minimizable : true,
                modal       : true,
                title       : 'Catalogo de Facturas',
                buttonAlign : 'center',
                constrain   : true,
                autoScroll  : true,
                //viewConfig: { style: {overflow: 'auto', overflowX: 'hidden' } },
                items:[
                 { xtype:'facturasgrid',
                  // width: 1190,
                  // heigth: 480,
                   x:5,
                   y:5
                 }
                ]


});
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
					if (Ext.getCmp('id').getValue().length== 0)
					{
						guardar();
					}else
					{
						modificar();
					}
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
				id: 'id',
				disabled: true
			},{
	             text: 'buscar',
	             xtype: 'button',
	             id: 'buscar',
	               iconCls: 'buscar',
	             x: 260,
	             y: -27,
	            handler:function() {
	          		//buscar(); USAR PARA BUSCAR USANDO LA CAJA DE TEXTO
	          		catalogofacturas();
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
	function modificar()
	{
		 		Ext.Ajax.request({
	     url: 'facturas/modificar',
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
	      Ext.getCmp('mipanelfacturas').getForm().reset();
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
	}
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

   function Seleccionarfactura() {
	 Ext.getCmp('id').setValue(data.id);
     Ext.getCmp('subtotal').setValue(data.subtotal);
      Ext.getCmp('iva').setValue(data.iva);
     Ext.getCmp('id').focus();
     ventanacatalogofacturas.close();	
}
function catalogofacturas() {
/*  transportistasStore.load();	
  if (transportistasStore.getTotalCount() <= 0 ) {
	  Ext.Msg.alert("Error", "Tabla de Datos de Transportistas esta vacia!");
  }
  else {
  */ 
   //Instanciamos la ventana
   if (ventanacatalogofacturas==null) {
    ventanacatalogofacturas = Ext.create('miventanacatalogofacturas');
   }
   //ventanacatalogofacturas.setPosition(posx,posy);
   ventanacatalogofacturas.show();
   
  //}

}
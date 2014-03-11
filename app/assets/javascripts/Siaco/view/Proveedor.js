var tabs = null;
var ventanacatalogoproveedores = null;
var storeF = null;
Ext.onReady(function() {
	
	Ext.QuickTips.init();

//MODELO PARA EL CATALOGO DE PROPIETARIOS
Ext.define("Proveedor", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id',
      type: 'string'
    }, {
      name: 'rif',
      type: 'string'
    }, {
      name: 'nombre',
      type: 'string'
    }, {
      name: 'direccion',
      type: 'string'
    },{
      name: 'telefono',
      type: 'string'
    },{
      name: 'email',
      type: 'string'
    },{
      name: 'celular',
      type: 'string'
    }
  ]
});

//STORE DE ProveedorS PARA EL CATALOGO
proveedoresStore = Ext.create('Ext.data.Store', {
  model: 'Proveedor',
  proxy: {
    type: 'ajax',
    url: 'proveedores/catalogo',
    reader: {
      type: 'json',
      root: 'datos'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.proveedoresGrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Proveedors'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.proveedoresgrid',
    id: 'proveedoresgridid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "rif", width:100 ,flex: 1, dataIndex: 'rif', sortable: true},
            {text: "nombre", width: 100, dataIndex: 'nombre', sortable: true},
            {text: "direccion", flex: 1, dataIndex: 'direccion', sortable: true},
            {text: "telefono", flex: 1, dataIndex: 'telefono', sortable: true},
            {text: "email", flex: 1, dataIndex: 'email', sortable: true},
            {text: "celular", flex: 1, dataIndex: 'celular', sortable: true},
              
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
                        Seleccionarproveedor();
                     
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
                       ventanacatalogoproveedores.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = proveedoresStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 Seleccionarproveedor();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miventanacatalogoproveedores', {
    extend: 'Ext.window.Window',

                layout: 'fit',
                x: 100,
                y: 70,
                width       : 385,
                height      : 200,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                maximizable : true,
                minimizable : true,
                modal       : true,
                title       : 'Catalogo de Proveedores',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'proveedoresgrid' }
                
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
						Ext.getCmp('mipanelproveedores').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
        id: 'btnguardar',
        disabled: true,
				handler:function() {

						guardar();

				}
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
        id: 'btneliminar',
        disabled: true,
				handler:function() {
					eliminar();
				}
				},{
        text: 'SENIAT',
        id: 'btnseniat',
        handler:function() {
          validarseniat();
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
				fieldLabel:'Rif',
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
        Ext.getCmp('proveedoresgridid').getStore().load();
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
	              rif: Ext.getCmp('rif').getValue()
	         },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
			 loadingMask.hide();
              datos=Ext.JSON.decode(resultado.responseText);
              Ext.Msg.alert('Mensaje', datos.msg);
			  Ext.getCmp('mipanelproveedores').getForm().reset();
         Ext.getCmp('proveedoresgridid').getStore().load();
                      
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
        Ext.getCmp('proveedoresgridid').getStore().load();

	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
   }



function Seleccionarproveedor() {
   Ext.getCmp('rif').setValue(data.rif);
   Ext.getCmp('nombre').setValue(data.nombre);
   Ext.getCmp('direccion').setValue(data.direccion);
   Ext.getCmp('telefono').setValue(data.telefono);
   Ext.getCmp('email').setValue(data.email);
   Ext.getCmp('celular').setValue(data.celular);

     ventanacatalogoproveedores.close(); 
     Ext.getCmp('btneliminar').enable(true);
     Ext.getCmp('btnguardar').enable(true);
}

function catalogoproveedores() {
/*  transportistasStore.load(); 
  if (transportistasStore.getTotalCount() <= 0 ) {
    Ext.Msg.alert("Error", "Tabla de Datos de Transportistas esta vacia!");
  }
  else {
  */ 
   //Instanciamos la ventana
   if (ventanacatalogoproveedores==null) {
    ventanacatalogoproveedores = Ext.create('miventanacatalogoproveedores');
   }
   //ventanacatalogopropietarios.setPosition(posx,posy);
   ventanacatalogoproveedores.show();
   
  //}

}

function validarseniat()
{
       Ext.Ajax.request({
     url: 'proveedores/obtenerEmpresa',
         method: 'GET',
     //Enviando los parametros a la pagina servidora
     params: {
      ajax: 'true',
      funcion: 'obtenerEmpresa',
      rif: Ext.getCmp('rif').getValue()
     },
     //Retorno exitoso de la pagina servcedulaora a traves del formato JSON
     success: function( resultado, request ) {
      datos=Ext.JSON.decode(resultado.responseText);
      if (datos.exito=='true') {
       if (Ext.getCmp('rif').getValue() != "")
       {
      Ext.Msg.alert("Exito", "La Empresa esta registrada en el SENIAT y sus datos son los siguientes:");
       Ext.getCmp('rif').setValue(datos.rif);
       Ext.getCmp('nombre').setValue(datos.nombre);
       Ext.getCmp('direccion').setValue(datos.direccion);
       Ext.getCmp('telefono').setValue(datos.telefono);
       Ext.getCmp('email').setValue(datos.correo);
       Ext.getCmp('btnguardar').enable(true);
        }else
        {
          Ext.Msg.alert("Error" ,"Debe escribir un RIF valido");
        }
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
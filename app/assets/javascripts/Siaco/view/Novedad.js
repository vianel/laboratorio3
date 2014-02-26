var ventanatiponovedades = null;
var ventanacatalogoinmuebles = null;
Ext.onReady(function() {
	
	Ext.QuickTips.init();

//MODELO PARA EL CATALOGO DE PROPIETARIOS
Ext.define("Inmueble", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id',
      type: 'string'
    }, {
      name: 'condominio_id',
      type: 'string'
    }, {
      name: 'propietario_id',
      type: 'string'
    }, {
      name: 'usuario_id',
      type: 'string'
    }, {
      name: 'codigo_inmueble',
      type: 'string'
    }, {
      name: 'numero',
      type: 'string'
    }
  ]
});

//STORE DE Inmuebles PARA EL CATALOGO
inmuebleStore = Ext.create('Ext.data.Store', {
  model: 'Inmueble',
  proxy: {
    type: 'ajax',
    url: 'inmuebles/catalogo',
    reader: {
      type: 'json',
      root: 'datos'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.Inmueblesgrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.inmueblesgrid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "id", flex: 1, dataIndex: 'id', sortable: true},
            {text: "condominio_id", flex: 1, dataIndex: 'condominio_id', sortable: true},
            {text: "numero", flex: 1, dataIndex: 'numero', sortable: true},
            
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
                        seleccionarinmueble();
                     
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
                       ventanacatalogoinmuebles.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = inmuebleStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 seleccionarinmueble();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miventanacatalogoinmueble', {
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
                title       : 'Catalogo de Inmueble',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'inmueblesgrid' }
                
                ]


            });
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
					guardarnovedad();
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
				xtype: 'timefield',
				name: 'entrada',
				id: 'entrada'
			},{
				fieldLabel: 'Salida',
				//xtype: 'datepicker',
				xtype: 'timefield',
				name: 'salida',
				id: 'salida'
			},{
				fieldLabel: 'Inmueble',
				xtype: 'textfield',
				name: 'inmueble',
				id: 'inmueble'
			},{
	             text: '...',
	             xtype: 'button',
	               iconCls: 'buscar',
	             id: 'catalogoinmueble',
	             x: 260,
	             y: -27,
	            handler:function() {
	         	 catalogoinmueble();
	          }
      		},{
				fieldLabel: 'Publicar',
				xtype: 'checkbox',
				name: 'publicar',
				id: 'publicar'
			}
			];
			this.callParent();
			Ext.getCmp('cedula').focus();
		}
	});
}); //FIN DEL ONREADY

function seleccionarinmueble() {
   Ext.getCmp('inmueble').setValue(data.id);

     ventanacatalogoinmuebles.close(); 
}

function catalogoinmueble() {
/*  transportistasStore.load(); 
  if (transportistasStore.getTotalCount() <= 0 ) {
    Ext.Msg.alert("Error", "Tabla de Datos de Transportistas esta vacia!");
  }
  else {
  */ 
   //Instanciamos la ventana
   if (ventanacatalogoinmuebles==null) {
    ventanacatalogoinmuebles = Ext.create('miventanacatalogoinmueble');
   }
   //ventanacatalogoinmueble.setPosition(posx,posy);
   ventanacatalogoinmuebles.show();
   
  //}

}

   function guardarnovedad()
   {
   		Ext.Ajax.request({
	     url: 'novedades/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      cedula: Ext.getCmp('cedula').getValue(), //obtiene el valor a traves del id del campo
	      nombre: Ext.getCmp('nombre').getValue(),
	      apellido: Ext.getCmp('apellido').getValue(),
	      placavehiculo: Ext.getCmp('placavehiculo').getValue(),
	      descripcion: Ext.getCmp('descripcion').getValue(),
	      entrada: Ext.getCmp('entrada').getValue(),
	      salida: Ext.getCmp('salida').getValue(),
	      inmueble: Ext.getCmp('inmueble').getValue(),
	      publicar: Ext.getCmp('publicar').getValue(),

	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelnovedades').getForm().reset();
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
   }
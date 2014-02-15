var tabs = null;
var ventana = null;
var edosolvenciastore = ['Solvente','Moroso'];
var ventanacatalogosanciones = null;

Ext.onReady(function() {

	
	Ext.QuickTips.init();
//GRIDPARACATALOGOSANCIONES

Ext.define('Siaco.view.SancionesGrid', {
    extend: 'Ext.grid.Panel',
    store: Ext.create('Siaco.store.Sanciones'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.sancionesgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', sortable: false},
            {text: "id", dataIndex: 'id', sortable: true},
            {text: "inmueble id",  dataIndex: 'inmueble_id', sortable: true},
            {text: "tipo", dataIndex: 'tipo_id', sortable: true},
            {text: "descripcion", dataIndex: 'descripcion', sortable: true},
            {text: "fecha_realizacion",  dataIndex: 'fecha_realizacion', sortable: true},
            {text: "condicion",  dataIndex: 'condicion', sortable: true},
            {text: "estado_solvencia",  dataIndex: 'estado_solvencia', sortable: true},
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
                    	 Seleccionarsancion();
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
                       ventanacatalogosanciones.close();
                      }
                    }
                }
    ]
  } ];
        // Origen de los datos, de un data store
        //this.store = facturasStore;
    //   this.store = Ext.getStore('facturasStore')
      //  this.forceFit = true;

       storeF = Ext.getStore('sancionesStore')
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
                               	 Seleccionarsancion();
                                }
                            }
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});
//MODELO
Ext.define('Inmueble', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'inmuebles/buscar'
           }
});


//Definicion del Data Store
var InmuebleStore = Ext.create('Ext.data.Store', {
    model: 'Inmueble',
    autoLoad: true,
});
Ext.define('tiposancion', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'nombre', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'tiposanciones/buscar'
           }
});

//Definicion del Data Store
var tiposancionStore = Ext.create('Ext.data.Store', {
    model: 'tiposancion',
    autoLoad: true,
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
						Ext.getCmp('mipanelsanciones').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
			
							  guardarsancion();

				}
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
				handler:function() {
					 eliminarsancion();
  						}
				
				},{
	             text: 'buscar',
	             xtype: 'button',
	             id: 'buscar',
	               iconCls: 'buscar',
	             x: 260,
	             y: -27,
	            handler:function() {
	          		//buscar(); USAR PARA BUSCAR USANDO LA CAJA DE TEXTO
	          		catalogosanciones();
	          		}
      		}]
			}];
			this.callParent();
		}
	});

Ext.define('miventanacatalogosanciones', {
    extend: 'Ext.window.Window',

                layout      : 'absolute',
                width       : 820,
                height      : 200,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : false,
                maximizable : true,
                minimizable : true,
                modal       : true,
                title       : 'Catalogo de Sanciones',
                buttonAlign : 'center',
                constrain   : true,
                autoScroll  : true,
                //viewConfig: { style: {overflow: 'auto', overflowX: 'hidden' } },
                items:[
                 { xtype:'sancionesgrid',
                  // width: 1190,
                  // heigth: 480,
                   x:5,
                   y:5
                 }
                ]


});
Ext.define('Siaco.view.Sancion', {
		extend: 'App.MiPanel',
		xtype: 'sancionview',
		alias: 'widget.mipanelsanciones',
		id: 'mipanelsanciones',
		title: 'Sancionar',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				xtype:'combobox',
                id : 'inmueble',
                fieldLabel: 'inmueble',
                store: InmuebleStore,
                valueField: 'id',
                displayField: 'id',   
                queryMode: 'remote',
                typeAhead: true,
                emptyText:'Seleccionar',
                triggerAction: 'all',
                selecOnFocus: true
			},{
				xtype:'combobox',
                id : 'tiposancion',
                fieldLabel: 'Tipo Sancion',
                store: tiposancionStore,
                valueField: 'id',
                displayField: 'nombre',   
                queryMode: 'remote',
                typeAhead: true,
                emptyText:'Seleccionar',
                triggerAction: 'all',
                selecOnFocus: true
			},{
	             text: '...',
	             xtype: 'button',
	             id: 'nuevotiposancion',
	             x: 260,
	             y: -27,
		        handler:function() {
					nuevotiposancion();
				}
      		},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			},{
				fieldLabel: 'Fecha Realizacion',
				xtype: 'datefield',
				name: 'fecharealizacion',
				id: 'fecharealizacion'
			},{
				fieldLabel: 'Condicion',
				xtype: 'textfield',
				name: 'condicion',
				id: 'condicion'
			},{
				fieldLabel: 'Estado de Solvencia',
				xtype: 'combobox',
				store: edosolvenciastore,
				name: 'edosolvencia',
				id: 'edosolvencia'
			}
			
			];
			this.callParent();
			Ext.getCmp('inmueble').focus();
		}
	});
	

}); //FIN DEL ONREADY

function nuevotiposancion(){
	 //Instanciamos la ventana
   	Ext.create('Ext.window.Window',{
		    		items: [
		    			{
		    				xtype: 'tiposancionView'
		    			}
		    		],
		    		autoScroll: true,
		    		maxHeight: 600
		    	}).show()
}
function guardarsancion() {
  Ext.Ajax.request({
    url: "sanciones/grabarsancion",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "grabarsancion",
      inmueble_id: Ext.getCmp("inmueble").getValue(),
      tiposancion_id: Ext.getCmp("tiposancion").getValue(),
      descripcion: Ext.getCmp("descripcion").getValue(),
      fecharealizacion: Ext.getCmp("fecharealizacion").getValue(),
      condicion: Ext.getCmp("condicion").getValue(),
      edosolvencia: Ext.getCmp("edosolvencia").getValue()
    },
    success: function(resultado, request) {
      var datos;
      datos = Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert("Exito", datos.msg);
      Ext.getCmp("mipanelsanciones").getForm().reset();
    },
    failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado!");
    }
  });
};
function Seleccionarsancion() {
	 Ext.getCmp('inmueble').setValue(data.inmueble_id);
     Ext.getCmp('tiposancion').setValue(data.tipo_id);
     Ext.getCmp('descripcion').setValue(data.descripcion);
     Ext.getCmp('fecharealizacion').setValue(data.fecha_realizacion);
     Ext.getCmp('condicion').setValue(data.condicion);
     Ext.getCmp('edosolvencia').setValue(data.estado_solvencia);
    
     ventanacatalogosanciones.close();	
}
function catalogosanciones() {

   //Instanciamos la ventana
   if (ventanacatalogosanciones==null) {
    ventanacatalogosanciones = Ext.create('miventanacatalogosanciones');
   }
   //ventanacatalogofacturas.setPosition(posx,posy);
   ventanacatalogosanciones.show();
   
  //}


}


function eliminarsancion() {
  var loadingMask;
  loadingMask = new Ext.LoadMask(Ext.getBody(), {
    msg: "eliminando..."
  });
  loadingMask.show();
  Ext.Ajax.request({
    url: "sanciones/eliminar",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "eliminar",
      id: data.id,
    },
    success: function(resultado, request) {
      var datos;
      loadingMask.hide();
      datos = Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert("Mensaje", datos.msg);
      Ext.getCmp("mipanelsanciones").getForm().reset();
    },
    failure: function(f, a) {
      loadingMask.hide();
      if (a.failureType === Ext.form.Action.CONNECT_FAILURE) {
        Ext.Msg.alert("Error", "El servidor reporta:" + a.response.status + " " + a.response.statusText);
      }
      if (a.failureType === Ext.form.Action.SERVER_INVALID) {
        Ext.Msg.alert("Advertencia", a.result.errormsg);
      }
    }
  });
};
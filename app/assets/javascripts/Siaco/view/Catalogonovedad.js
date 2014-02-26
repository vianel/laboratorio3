//MODELO PARA EL CATALOGO DE PROPIETARIOS
Ext.define("Novedad", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id',
      type: 'string'
    }, {
      name: 'codigo_novedades',
      type: 'string'
    }, {
      name: 'inmueble_id',
      type: 'string'
    }, {
      name: 'cedula',
      type: 'string'
    }, {
      name: 'nombre',
      type: 'string'
    }, {
      name: 'apellido',
      type: 'string'
    },{
      name: 'placa_vehiculo',
      type: 'string'
    },{
      name: 'descripcion',
      type: 'string'
    },{
      name: 'hora_entrada',
      type: 'string'
    },{
      name: 'hora_salida',
      type: 'string'
    },{
      name: 'empleado_id',
      type: 'string'
    }
  ]
});

//STORE DE Inmuebles PARA EL CATALOGO
novedadesStore = Ext.create('Ext.data.Store', {
  model: 'Novedad',
  proxy: {
    type: 'ajax',
    url: 'novedades/catalogo',
    reader: {
      type: 'json',
      root: 'datos'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.Novedadesgrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.novedadesgrid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Cedula", flex: 1, dataIndex: 'cedula', sortable: true},
            {text: "Nombre", flex: 1, dataIndex: 'nombre', sortable: true},
            {text: "Apellido", flex: 1, dataIndex: 'apellido', sortable: true},
            {text: "Placa vehiculo", flex: 1, dataIndex: 'placa_vehiculo', sortable: true},
            {text: "Descripcion", flex: 1, dataIndex: 'descripcion', sortable: true},
            {text: "Hora salida", flex: 1, dataIndex: 'hora_salida', sortable: true},
            {text: "Hora salida", flex: 1, dataIndex: 'hora_salida', sortable: true},
            {text: "Empleado", flex: 1, dataIndex: 'empleado_id', sortable: true},
            
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
                       ventanacatalogonovedades.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = novedadesStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 seleccionarnovedad();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});

//Definicion de la ventana contendora del grid
Ext.define('Siaco.view.Catalogonovedad', {
    extend: 'Ext.form.Panel',
    xtype: 'catalogonovedadview',
    alias: 'widget.catalogonovedades',
    id: 'catalogonovedades',
    bodyPadding: 5,
    width: 585,

                layout: 'fit',

                width       : 585,
                height      : 400,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                maximizable : true,
                minimizable : true,
                modal       : true,
                title       : 'Catalogo de Novedades',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'novedadesgrid' }
                
                ]


            });
//MODELO PARA EL CATALOGO DE PROPIETARIOS
Ext.define("Reservacion", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id',
      type: 'string'
    }, {
      name: 'codigo_reservaciones',
      type: 'string'
    }, {
      name: 'ingreso_id',
      type: 'string'
    }, {
      name: 'area_comun_id',
      type: 'string'
    }, {
      name: 'fecha_reservacion',
      type: 'date'
    }, {
      name: 'inmueble_id',
      type: 'string'
    },{
      name: 'fecha_uso',
      type: 'date'
    },{
      name: 'hora_inicio',
      type: 'date'
    },{
      name: 'hora_fin',
      type: 'date'
    },{
      name: 'numero_invitados',
      type: 'string'
    }
  ]
});

//STORE DE Inmuebles PARA EL CATALOGO
reservacionesStore = Ext.create('Ext.data.Store', {
  model: 'Reservacion',
  proxy: {
    type: 'ajax',
    url: 'reservaciones/catalogo',
    reader: {
      type: 'json',
      root: 'datos'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.Reservacionesgrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.reservacionesgrid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "ID", flex: 1, dataIndex: 'id', sortable: true},
            {text: "Ingreso", flex: 1, dataIndex: 'ingreso_id', sortable: true},
            {text: "Area Comun", flex: 1, dataIndex: 'area_comun_id', sortable: true},
            {text: "Fecha Reservacion", flex: 1, dataIndex: 'fecha_reservacion', sortable: true},
            {text: "Inmueble", flex: 1, dataIndex: 'inmueble_id', sortable: true},
            {text: "Fecha Uso", flex: 1, dataIndex: 'fecha_uso', sortable: true},
            
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
                        seleccionarreservacion();
                     
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
                       ventanacatalogoreservaciones.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = reservacionesStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 seleccionarReservacion();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});

//Definicion de la ventana contendora del grid
Ext.define('Siaco.view.Catalogoreservacion', {
    extend: 'Ext.form.Panel',
    xtype: 'catalogoreservacionview',
    alias: 'widget.catalogoreservaciones',
    id: 'catalogoreservaciones',
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
                title       : 'Catalogo de Reservaciones',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'reservacionesgrid' }
                
                ]


            });
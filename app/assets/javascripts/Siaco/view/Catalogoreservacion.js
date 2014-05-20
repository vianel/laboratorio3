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
      type: 'string'
    }, {
      name: 'inmueble_id',
      type: 'string'
    },{
      name: 'fecha_uso',
      type: 'string'
    },{
      name: 'hora_inicio',
      type: 'string'
    },{
      name: 'hora_fin',
      type: 'string'
    },{
      name: 'numero_invitados',
      type: 'string'
    },{
      name: 'lista_invitados1',
      type: 'string'
    },{
      name: 'lista_invitados',
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
    id: 'reservacionesgrid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "ID", flex: 1, width: 3, dataIndex: 'id', sortable: true},
            {text: "Ingreso", flex: 1, dataIndex: 'ingreso_id', sortable: true},
            {text: "Area Comun", flex: 1,dataIndex: 'area_comun_id', sortable: true},
            {text: "Fecha Reservacion", flex: 1, dataIndex: 'fecha_reservacion', sortable: true},
            {text: "Inmueble", flex: 1, dataIndex: 'inmueble_id', sortable: true},
            {text: "Fecha Uso", flex: 1, dataIndex: 'fecha_uso', sortable: true},
            {text: "Inicio", flex: 1, dataIndex: 'hora_inicio', sortable: true},
                      {
                  xtype:'actioncolumn',  
                  width:150,
                  text: 'Lista Invitados',
                  align: 'center',
                  items: [{
                      icon: 'images/ver.png', 
                      tooltip: 'Ver',
                      handler: function(grid, rowIndex, colIndex) {
                       grid.getSelectionModel().select(rowIndex, false, true);
                       data = grid.getSelectionModel().selected.items[0].data;
                       mostrarpdfampliado(data.lista_invitados,data.lista_invitados1); 
                      }
                                 
                  }]
              }
            
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
                       refrescar();
                       catalogoreservaciones.close();
                        
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

                width       : 800,
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



function mostrarpdfampliado(nombrepdf, elpdf)  {

     //Definicion de la clase MiVentana
     Ext.define('myWindow', {
      extend: 'Ext.window.Window',

                  layout      : 'absolute',
                  width       : 620,
                  height      : 520,
                  x: parseInt((screen.width/2)-(600/2)),
                  y: parseInt((screen.height/2)-(500/2)),
                  closeAction :'hide',
                  plain       : true,
                  closable    : true,
                  closeAction : 'hide',
                  constrain   : true,
                  resizable   : true,
                  maxizable   : true,
                  title       : "Mostrando "+nombrepdf,
                  buttonAlign : 'center',
                  items:[
                   { xtype: 'component',
                     x:10,
                     y:10,
                     width: 590,
                     height: 470,
                     src: elpdf,
                     border: false,
                     frame: false,
                     autoEl: {
                         tag: 'iframe',
                         src: elpdf
                     }
                   }
                  ]


              });
     var win = Ext.create('myWindow');
     win.show();
}

function refrescar ()
{
 Ext.getCmp('reservacionesgrid').getStore().removeAll();
 Ext.getCmp('reservacionesgrid').getStore().sync();
 Ext.getCmp('reservacionesgrid').getStore().load();
}

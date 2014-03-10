var tabs = null;
var  ventanacatalogofacturaspendientes = null;
var ventanacatalogofacturaspagadas = null;
Ext.onReady(function() {
  
  Ext.QuickTips.init();


//CATALOGO FACTURAS PAGADAS
Ext.define("Facturahidrolara", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'codigo_facturacion',
      type: 'string'
    },{
      name: 'fecha_emision',
      type: 'string'
    },{
      name: 'fecha_vencimiento',
      type: 'string'
    },{
      name: 'concepto',
      type: 'string'
    },{
      name: 'monto',
      type: 'string'
    }
  ]
});


facturaspendientesStore = Ext.create('Ext.data.Store', {
  model: 'Facturahidrolara',
  proxy: {
    type: 'ajax',
    url: 'hidrolara/catalogofacturaspendientes',
    reader: {
      type: 'json',
      root: 'recibosPendientes'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.facturaspendientesGrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Proveedors'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.facturaspendientesgrid',
    title: 'Facturas pendientes',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "codigo", width:100 ,flex: 1, dataIndex: 'codigo_facturacion', sortable: true},
            {text: "Emision", width: 100, dataIndex: 'fecha_emision', sortable: true},
            {text: "Vencimiento", flex: 1, dataIndex: 'fecha_vencimiento', sortable: true},
            {text: "Concepto", flex: 1, dataIndex: 'concepto', sortable: true},
            {text: "Monto", flex: 1, dataIndex: 'monto', sortable: true},
              
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
                        Seleccionarfacturapendiente();
                     
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
                       ventanacatalogofacturaspendientes.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = facturaspendientesStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 Seleccionarfacturapendiente();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});


//Definicion de la ventana contendora del grid
Ext.define('miventanacatalogofacturaspendientes', {
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
                title       : 'Facturas Pendientes',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'facturaspendientesgrid' }
                
                ]


            });

//CATALOGO DE FACTURAS PAGADAS
facturaspagadasStore = Ext.create('Ext.data.Store', {
  model: 'Facturahidrolara',
  proxy: {
    type: 'ajax',
    url: 'hidrolara/catalogofacturaspagadas',
    reader: {
      type: 'json',
      root: 'recibosPagados'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.facturaspagadasGrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Proveedors'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.facturaspagadasgrid',
    title: 'Facturas Pagadas',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "codigo", width:100 ,flex: 1, dataIndex: 'codigo_facturacion', sortable: true},
            {text: "Emision", width: 100, dataIndex: 'fecha_emision', sortable: true},
            {text: "Vencimiento", flex: 1, dataIndex: 'fecha_vencimiento', sortable: true},
            {text: "Concepto", flex: 1, dataIndex: 'concepto', sortable: true},
            {text: "Monto", flex: 1, dataIndex: 'monto', sortable: true},
              
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
                        Seleccionarfacturapendiente();
                     
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
                       ventanacatalogofacturaspagadas.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = facturaspagadasStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 Seleccionarfacturapendiente();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});


//Definicion de la ventana contendora del grid
Ext.define('miventanacatalogofacturaspagadas', {
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
                title       : 'Facturas pagadas',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'facturaspagadasgrid' }
                
                ]


            });
    Ext.define('App.MiPanel', {
    extend: 'Ext.form.Panel',
    
    initComponent : function() {
      this.dockedItems = [{
        dock: 'bottom',
        buttons: [{
        text: 'Pendientes',
        handler:function() {
          catalogofacturaspendientes();
        }
        },{
        text: 'Pagadas',
        handler:function() {
          catalogofacturaspagadas();
        }
        }]
      }];
      this.callParent();
    }
  });
Ext.define('Siaco.view.Hidrolara', {
    extend: 'App.MiPanel',
    xtype: 'hidrolaraview',
    alias: 'widget.mipanelhidrolara',
    id: 'mipanelhidrolara',
    title: 'Panel Hidrolara',
    bodyPadding: 5,
    width: 450,
    
    initComponent: function () {
      
      this.items = [
        
        { xtype:'facturaspendientesgrid' },
         { xtype:'facturaspagadasgrid' }
      
      ];
      this.callParent();
    }
  });
  
}); //FIN DEL ONREADY
function Seleccionarfacturapendiente() {


     ventanacatalogofacturaspendientes.close(); 

}
function catalogofacturaspendientes() {
/*  transportistasStore.load(); 
  if (transportistasStore.getTotalCount() <= 0 ) {
    Ext.Msg.alert("Error", "Tabla de Datos de Transportistas esta vacia!");
  }
  else {
  */ 
   //Instanciamos la ventana
   if (ventanacatalogofacturaspendientes==null) {
    ventanacatalogofacturaspendientes = Ext.create('miventanacatalogofacturaspendientes');
   }
   //ventanacatalogofacturaspendientescatalogopropietarios.setPosition(posx,posy);
   ventanacatalogofacturaspendientes.show();
   
  //}

}

function catalogofacturaspagadas() {
/*  transportistasStore.load(); 
  if (transportistasStore.getTotalCount() <= 0 ) {
    Ext.Msg.alert("Error", "Tabla de Datos de Transportistas esta vacia!");
  }
  else {
  */ 
   //Instanciamos la ventana
   if (ventanacatalogofacturaspagadas==null) {
    ventanacatalogofacturaspagadas = Ext.create('miventanacatalogofacturaspagadas');
   }
   //ventanacatalogofacturaspagadascatalogopropietarios.setPosition(posx,posy);
   ventanacatalogofacturaspagadas.show();
   
  //}

}
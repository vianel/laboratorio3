//MODELO PARA EL CATALOGO DE inmuebles
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
    },{
      name: 'alicuota',
      type: 'string'
    },{
      name: 'saldo_a_favor',
      type: 'string'
    },{
      name: 'edosolvencia',
      type: 'string'
    },{
      name: 'propietario',
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

Ext.define('Siaco.view.Inmueblesgridcompleto', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.inmueblesgridcompleto',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "id", flex: 1, dataIndex: 'id', sortable: true},
            {text: "numero", flex: 1, dataIndex: 'numero', sortable: true},
            {text: "Alicuota", flex: 1, dataIndex: 'alicuota', sortable: true},
            {text: "Saldo a favor", flex: 1, dataIndex: 'saldo_a_favor', sortable: true},
            {text: "Estado", flex: 1, dataIndex: 'edosolvencia', sortable: true},
            {text: "Propietario", flex: 1, dataIndex: 'propietario',sortable:true},
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
Ext.define('Siaco.view.Catalogoinmueble', {
    extend: 'Ext.form.Panel',
    xtype: 'catalogoinmuebleview',
    alias: 'widget.catalogoinmuebles',
    id: 'catalogoinmuebless',
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
                title       : 'Catalogo de Inmuebles',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'inmueblesgridcompleto' }
                
                ]


            });
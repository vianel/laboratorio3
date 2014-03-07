var arreglover = ['Pagados','No pagados','Todos'];

//MODELO PARA EL CATALOGO DE PROPIETARIOS
Ext.define("Ingreso", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id',
      type: 'string'
    }, {
      name: 'codigo_ingresos',
      type: 'string'
    }, {
      name: 'inmuebles_id',
      type: 'string'
    }, {
      name: 'concepto_ingresos_id',
      type: 'string'
    }, {
      name: 'fecha',
      type: 'string'
    }, {
      name: 'monto',
      type: 'string'
    },{
      name: 'abono',
      type: 'string'
    },{
      name: 'pagado',
      type: 'string'
    }
  ]
});

filtrar('Todos');

Ext.define('Siaco.view.Ingresosgrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.ingresosgrid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Inmueble", flex: 1, dataIndex: 'inmuebles_id', sortable: true},
            {text: "Concepto", flex: 1, dataIndex: 'concepto_ingresos_id', sortable: true},
            {text: "Fecha", flex: 1, dataIndex: 'fecha', sortable: true},
            {text: "Monto", flex: 1, dataIndex: 'monto', sortable: true},
            {text: "Abono", flex: 1, dataIndex: 'abono', sortable: true},
            {text: "Pagado", flex: 1, dataIndex: 'pagado', sortable: true},
            
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
                       ventanacatalogoingresos.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = ingresosStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 seleccionaringreso();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});

//Definicion de la ventana contendora del grid
Ext.define('Siaco.view.Catalogoingreso', {
    extend: 'Ext.form.Panel',
    xtype: 'catalogoingresoview',
    alias: 'widget.catalogoingresos',
    id: 'catalogoingresos',
    bodyPadding: 5,
    width: 585,
    title: 'Catalogo de Ingresos',
                
                items:[
              {
                  xtype:'combobox',
                  id : 'formadepago',
                  fieldLabel: 'Ver solo ',
                  store: arreglover
              },{
                  xtype: 'button',
                  text: 'Buscar',
                  x: 260,
                  y: -27,
                  listeners: {
                    click: function () {
                      filtrar(Ext.getCmp('formadepago').value);
                    }
                  }
              },{ 
                  xtype:'ingresosgrid' 
                }
                
                ]


            });


function filtrar (valor)
{
  ingresosStore = Ext.create('Ext.data.Store', {
  model: 'Ingreso',
  proxy: {
    type: 'ajax',
    url: 'ingresos/catalogo',
    reader: {
      type: 'json',
      root: 'datos'
    }
  },
  autoLoad: true
});
}
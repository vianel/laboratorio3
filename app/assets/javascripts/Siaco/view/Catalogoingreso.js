

var arreglover = ['Pagados','No pagados','Todos'];

Ext.onReady(function(){

    Ext.QuickTips.init();
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
      type: 'bool'
    }
  ]
});

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


Ext.define('Siaco.view.Ingresosgrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.ingresosgrid',
    id: 'ingresosgridid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {


        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "ID", flex: 1, dataIndex: 'id', sortable: true},
            {text: "Inmueble", flex: 1, dataIndex: 'inmuebles_id', sortable: true},
            {text: "Concepto", flex: 1, dataIndex: 'concepto_ingresos_id', sortable: true},
            {text: "Fecha", flex: 1, dataIndex: 'fecha', sortable: true},
            {text: "Monto", flex: 1, dataIndex: 'monto', sortable: true},
            {text: "Abono", flex: 1, dataIndex: 'abono', sortable: true},
          //  {text: "Pagado",flex: 1, dataIndex: 'pagado', sortable: true, draggable: true },
            {
              text: "Pagado",
              xtype: "checkcolumn",
              dataIndex: 'pagado',
              id: 'columnapagado',
             // renderer : makeCheckBox,
               listeners: {
                  checkchange: function(column, rowIndex, checked){
                       

                  },


    /**
     * Disables this CheckColumn.
     */
    onDisable: function() {
        this._setDisabled(true);
    }


              }
            },
            
        ];
        this.dockedItems = [ {
    xtype: 'toolbar',
    dock: 'bottom',
    filterable: true,
    items: [
    
     { xtype: 'button',
                    text: 'Aceptar',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                        //EL metodo  getModifiedRecords() me devuelve un arreglo de objetos con las filas modificadas 
                          var filasmodificadas =[];
                          var i = 0;
                          filasmodificadas = Ext.getCmp('ingresosgridid').getStore().getModifiedRecords().slice();
                         // alert (filasmodificadas.length)
                         if (filasmodificadas.length != 0)
                         {
                            modificarpagados(filasmodificadas);
                            for ( i = 0; i < filasmodificadas.length; i++) { 

                               // alert(filasmodificadas[i]['id'])
                             }
                          }else
                          {
                            alert('No se modifico ningun dato')
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
                }]
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


}); //FIN ONREADY

function filtrar (valor)
{
  if (valor === 'Pagados')
  {
     Ext.getCmp('ingresosgridid').getStore().removeAll();
     Ext.getCmp('ingresosgridid').getStore().sync();
     Ext.getCmp('ingresosgridid').getStore().load({url: 'ingresos/catalogopagados'});
  }else if (valor === 'No pagados')
  {
     Ext.getCmp('ingresosgridid').getStore().removeAll();
     Ext.getCmp('ingresosgridid').getStore().sync();
     Ext.getCmp('ingresosgridid').getStore().load({url: 'ingresos/catalogonopagados'});
  }else if (valor === 'Todos')
  {
     Ext.getCmp('ingresosgridid').getStore().removeAll();
     Ext.getCmp('ingresosgridid').getStore().sync();
     Ext.getCmp('ingresosgridid').getStore().load();
  }

}

function makeCheckBox(val){
      //name is an array
      return '<input checked="checked" name="check[]" value="val" type="checkbox"/>';
 }

 function modificarpagados(arreglo)
 {
  var tira = "{";
    for (var j = 0; j < arreglo.length; j++) { 

        tira += arreglo[j]['id']
        tira += [',']
        }
        tira += "}";
          Ext.Ajax.request({
       url: 'ingresos/actualizarpagos',
     method: 'GET',
       //Enviando los parametros a la pagina servidora
       params: {
        ajax: 'true',
        funcion: 'actualizarpagos',

        //datos: arreglo[0]['id'],
        

              datos: tira,
           
       },
       //Retorno exitoso de la pagina servidora a traves del formato JSON
       success: function( resultado, request ) {
        datos=Ext.JSON.decode(resultado.responseText);
        Ext.Msg.alert('Exito', datos.msg + tira + "Han sido Modificados exitosamente!");
         Ext.getCmp('ingresosgridid').getStore().removeAll();
         Ext.getCmp('ingresosgridid').getStore().sync();
         Ext.getCmp('ingresosgridid').getStore().load();

       },
       //No hay retorno de la pagina servidora
       failure: function() {
        Ext.Msg.alert("Error", "Servidor no conectado!");
       }
      });
 }
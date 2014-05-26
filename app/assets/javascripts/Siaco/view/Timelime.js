Ext.define("Cartelera", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id',
      type: 'string'
    },{
      name: 'codigo_cartelera',
      type: 'string'
    },{
      name: 'tipo_publicaciones_id',
      type: 'string'
    },{
      name: 'usuario_emisor_id',
      type: 'string'
    },{
      name: 'usuario_receptor_id',
      type: 'string'
    },{
      name: 'titulo',
      type: 'string'
    },{
      name: 'descripcion',
      type: 'string'
    },{
      name: 'fecha',
      type: 'string'
    }
  ]
});


publicacionesstore = Ext.create('Ext.data.Store', {
  model: 'Cartelera',
  proxy: {
    type: 'ajax',
    url: 'carteleras/catalogopublicaciones',
    reader: {
      type: 'json',
      root: 'datos'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.Timelime', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.timelimeView',
    xtype: 'timelimeView',
    id: 'timelimeid',

    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            
            {text: "Usuario", width: 10,flex: 1, dataIndex: 'usuario_emisor_id', sortable: true},
            {text: "Titulo", width: 100, dataIndex: 'titulo', sortable: true},
            {text: "Descripcion",width:100, flex: 1, dataIndex: 'descripcion', sortable: true},
            {text: "Fecha", flex: 1, dataIndex: 'fecha', sortable: true},
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
                      grid.getSelectionModel().select(rowIndex, false, true);
                       data = grid.getSelectionModel().selected.items[0].data;
                       mostrarpublicacion(data.usuario_emisor_id,data.titulo,data.descripcion,data.fecha); 
                     
                     
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
                       
                      }
                    }
                }     
    ]
  } ];
  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = publicacionesstore;
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
                          },
                          itemdblclick: function(grid, rowIndex, colIndex) {
                               grid.getSelectionModel().select(rowIndex, false, true);
                       data = grid.getSelectionModel().selected.items[0].data;
                       mostrarpublicacion(data.usuario_emisor_id,data.titulo,data.descripcion,data.fecha); 
                     
                          }

                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});


function mostrarpublicacion(usuario, titulo,descripcion,fecha)  {

     //Definicion de la clase MiVentana
     Ext.define('myWindow', {
      extend: 'Ext.window.Window',

                  layout      : 'absolute',
                  width       : 340,
                  height      : 120,
                  x: parseInt((screen.width/2)-(600/2)),
                  y: parseInt((screen.height/2)-(500/2)),
                  closeAction :'hide',
                  plain       : true,
                  closable    : true,
                  closeAction : 'hide',
                  constrain   : true,
                  resizable   : true,
                  maxizable   : true,
                  title       : fecha,
                  buttonAlign : 'center',
                  items:[
                        {
                        xtype: 'container',
                        height:75,
                        width:323,
                        layout:'absolute',
                        x:1,
                        y:10,
                        border: 1,
                        style: {borderColor:'#0099FF', borderStyle:'solid', borderWidth:'2px'},
                        items:[
                        {
                              xtype:'label',
                              style: {color:'#00C24E',size:'14px'},
                              text: titulo,
                              x:5,
                              y:5,
                              /*autoEl: {
                                  tag: 'a',
                                  href: 'http://www.example.com/',
                                  html: 'Example.com'
                              }*/
                           },{
                              xtype:'label',
                              text: descripcion,
                              x:5,
                              y:25,
                              height:30,
                           }/*,{
                              xtype:'label',
                              style: {color:'#000000',size:'01px'},
                              id:'fecha',
                              x:75,
                              y:48,
                              height:2,
                           }*/
                           ,{
                              xtype:'label',
                              style: {color:'#00C29E',size:'14px'},
                              text: usuario,
                              x:180,
                              y:45,
                              height:10,
                           }
                        ]  
                      }
                  ]


              });
     var win = Ext.create('myWindow');
     win.show();
}
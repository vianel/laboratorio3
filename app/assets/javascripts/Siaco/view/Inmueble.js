var tabs = null;
var ventana33 = null;
var arregloareacomun = ['Caney de fiestas','Piscina'];
Ext.onReady(function() {
  
  Ext.QuickTips.init();

//Definicion del Modelo
 Ext.define('Propietarios', {
    extend: 'Ext.data.Model',
    fields: [ {name:'NOMBRE',   type: 'string'},
              {name:'APELLIDO', type: 'string'} 
     ]
});

//Definicion del Data Store
var propietariosStore = Ext.create('Ext.data.Store', {
    model: 'Propietarios',
    autoload: true,
    proxy: {
                    type: 'ajax',
              url : '/inmueble/catalogo',
              reader: {
                  type: 'json',
                  root: 'datos'
              }
    }
});

//Definicion de la clase UsuariosGrid
Ext.define('App.PropietariosGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.propietariosgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "NOMBRE", flex: 1, dataIndex: 'NOMBRE', sortable: true},
            {text: "APELLIDO", width: 100, dataIndex: 'APELLIDO', sortable: true}
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
                        var usuario = data.usuario;
                        var clave = data.clave;
                        var nivel = data.nivel;
                        Ext.MessageBox.show({
                         title: 'Mensaje',
                         width:400,
                         buttons: Ext.MessageBox.OK
                        });
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
                       ventana33.close();
                      }
                    }
                }     
    ]
  } ];
        // Origen de los datos, de un data store
        this.store = propietariosStore;
        this.forceFit = true;
  this.scroll = false;
  this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
  //this.verticalScroller = {xtype: 'paginggridscroller'};
        this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                           alert(data.usuario);
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.PropietariosGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miVentana33', {
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
                title       : 'Catalogo de Propietarios',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'propietariosgrid' }
                
                ]


            });
    Ext.define('Siaco.view.botonerainmueble', {
    extend: 'Ext.form.Panel',
    
    initComponent : function() {
      this.dockedItems = [{
        dock: 'bottom',
        buttons: [{
          text: 'Limpiar',
          iconCls:'limpiar',
          handler: function() {
            Ext.getCmp('mipanelinmuebles').getForm().reset();
          }
          
        },{
        text: 'Grabar',
        iconCls:'grabar',
        handler:function() {
      
            guardarinmueble();
    
        }
        },{
        text: 'Validar',
        handler:function() {
          dialogo.show();
        }
        },{
        text: 'Eliminar',
        iconCls:'eliminar',
        handler:function() {
          Ext.Msg.alert('Pronto','En construccion');
        }
        }]
      }];
      this.callParent()
    }
  });
Ext.define('Siaco.view.Inmueble', {
    extend: 'Siaco.view.botonerainmueble',
    xtype: 'inmuebleview',
    alias: 'widget.mipanelinmuebles',
    id: 'mipanelinmuebles',
    title: 'Inmueble',
    bodyPadding: 5,
    width: 450,
    
    initComponent: function () {
      
      this.items = [
      {
        fieldLabel: 'Cedula Propietario',
        xtype: 'textfield',
        name: 'cedulapropietario',
        id: 'cedulapropietario'
      },{
             text: '...',
             xtype: 'button',
               iconCls: 'buscar',
             id: 'catalogopropietarios',
             x: 260,
             y: -27,
            handler:function() {
          verpropietarios();
          }
      },{
        fieldLabel: 'Alicuota',
        xtype: 'textfield',
        name: 'alicuota',
        id: 'alicuota'
      },{
        fieldLabel: 'Numero de apartamento',
        xtype: 'textfield',
        name: 'nroapartamento',
        id: 'nroapartamento'
      },{
        fieldLabel: 'Estado de solvencia',
        xtype: 'textfield',
        name: 'edosolvencia',
        id: 'edosolvencia'
      }
      ];
      this.callParent();
      Ext.getCmp('cedulapropietario').focus();
    }
  });


var dialogo = Ext.create('Ext.window.Window', {  
      title: "Buscar Cedula",  
      id: 'panelServicio1',  
      width: 255,  
      height: 90,  
      layout: 'absolute',  
      items: [{  
        xtype: 'label',  
        text: 'Cedula',  
        x: 10,  
        y: 13  
          },{  
        xtype: 'textfield',  
        id: 'id_cedrif',  
        value: '',  
        x: 70,  
        y: 10  
          },{  
        xtype: 'button',  
        text: 'Buscar',  
        x: 100,  
        y: 40,  
        listeners: {  
          click: function () {  
            enviar(Ext.getCmp('id_cedrif').getValue());  
          }  
        }  
          }]  
     });
  
}); //FIN DEL ONREADY
function verpropietarios(){
    if (ventana33==null) {
    ventana33 = Ext.create('miVentana33');
   }
   //ventana.setPosition(posx,posy);
   ventana33.show();
   
}

function enviar(id_cedrif) {  
Ext.Ajax.request({  
    //Llamar la direcion del servicio  
    url : 'http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=1',  
    //parametro de entrada  
    params : {  
      cedRifPersona: id_cedrif  
    },  
    success : function(resultado, request) {  
        //La tira JSON donde retorna los valores  
        datos = Ext.JSON.decode(resultado.responseText);  
          
        var mensaje;  
        if (datos.exito == true) {  
            mensaje = "La cedula pertenece a " + datos.nombre +" " + datos.apellido +", direccion " + datos.direccion +"";  
        } else {  
            mensaje = "La cedula no existe";  
        }  
          
        Ext.MessageBox.show({  
            title : 'Respuesta',  
            msg : mensaje,  
            width : 400,  
            buttons : Ext.MessageBox.OK  
        });  
    },  
    failure : function(error) {  
        Ext.Msg.alert("Error", "Servidor no conectado");  
    }  
});  
  
     };

function guardarinmueble()
   {
      Ext.Ajax.request({
       url: 'inmuebles/grabarinmueble',
     method: 'GET',
       //Enviando los parametros a la pagina servidora
       params: {
        ajax: 'true',
        funcion: 'grabarinmueble',

        cedula: Ext.getCmp('cedulapropietario').getValue(), //obtiene el valor a traves del id del campo
        alicuota: Ext.getCmp('alicuota').getValue(),
        nroapartamento: Ext.getCmp('nroapartamento').getValue(),
        edosolvencia: Ext.getCmp('edosolvencia').getValue(),
      
       },
       //Retorno exitoso de la pagina servidora a traves del formato JSON
       success: function( resultado, request ) {
        datos=Ext.JSON.decode(resultado.responseText);
        Ext.Msg.alert('Exito', datos.msg);
        Ext.getCmp('mipanelinmuebles').getForm().reset();
       },
       //No hay retorno de la pagina servidora
       failure: function() {
        Ext.Msg.alert("Error", "Servidor no conectado!");
       }
      });
   }
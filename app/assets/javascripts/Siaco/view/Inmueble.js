var tabs = null;
var ventanacatalogopropietarios = null;
var storeP = null;
var arregloareacomun = ['Caney de fiestas','Piscina'];
var arreglosolvencia = ['Solvente','Moroso'];

Ext.onReady(function() {
  
  Ext.QuickTips.init();

//MODELO PARA ELCOMBOBOX DE USUARIOS
Ext.define('Usuario', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'rol_id', type: 'string'},
            {name: 'login', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'usuarios/buscar'
           }
});


//Definicion del Data Store
var UsuarioStore = Ext.create('Ext.data.Store', {
    model: 'Usuario',
    autoLoad: true,
});
//MODELO PARA EL CATALOGO DE PROPIETARIOS
Ext.define("Propietario", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id',
      type: 'string'
    }, {
      name: 'nombre',
      type: 'string'
    }, {
      name: 'apellido',
      type: 'string'
    }, {
      name: 'cedula',
      type: 'string'
    }, {
      name: 'fecha_nacimiento',
      type: 'date'
    }, {
      name: 'direccion_alternativa',
      type: 'string'
    }, {
      name: 'telefono',
      type: 'string'
    }, {
      name: 'celular',
      type: 'string'
    },{
      name: 'correo',
      type: 'string'
    },{
      name: 'foto',
      type: 'string'
    },{
      name: 'foto1',
      type: 'string'
    }, {
      name: 'estado_civil',
      type: 'string'
    },{
      name:'inmueble',
      type: 'string'
    }
  ]
});

//STORE DE PROPIETARIOS PARA EL CATALOGO
propietariosStore = Ext.create('Ext.data.Store', {
  model: 'Propietario',
  proxy: {
    type: 'ajax',
    url: 'propietarios/catalogo',
    reader: {
      type: 'json',
      root: 'datos'
    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.PropietariosGrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.propietariosgrid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "id", flex: 1, dataIndex: 'id', sortable: true},
            {text: "nombre", flex: 1, dataIndex: 'nombre', sortable: true},
            {text: "apellido", width: 100, dataIndex: 'apellido', sortable: true},
            {text: "cedula", flex: 1, dataIndex: 'cedula', sortable: true},

      

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
                        Seleccionarpropietario();
                     
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
                       ventanacatalogopropietarios.close();
                      }
                    }
                }     
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = propietariosStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 Seleccionarpropietario();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miventanacatalogopropietarios', {
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
          catalogoperopietarios();
          }
      },{
        xtype:'combobox',
        id : 'usuariousuar',
        fieldLabel: 'usuario',
        store: UsuarioStore,
        valueField: 'id',
        displayField: 'login',   
        queryMode: 'remote',
        typeAhead: true,
        emptyText:'Seleccionar',
        triggerAction: 'all',
        selecOnFocus: true
      },{
               text: '...',
               xtype: 'button',
               id: 'nuevousuario',
               x: 260,
               y: -27,
            handler:function() {
          nuevousuario();
        }
          },{
        fieldLabel: 'Codigo inmueble',
        xtype: 'textfield',
        name: 'codigoinmueble',
        id: 'codigoinmueble'
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
        xtype:'combobox',
        id : 'edosolvencia',
        fieldLabel: 'Estado de Solvencia',
        store: arreglosolvencia
      },{
        fieldLabel: 'Saldo a favor',
        xtype: 'textfield',
        name: 'saldoinmueble',
        id: 'saldoinmueble'
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
        usuario: Ext.getCmp('usuariousuar').getValue(),
        codigoinmueble: Ext.getCmp('codigoinmueble').getValue(),
        nroapartamento: Ext.getCmp('nroapartamento').getValue(),
        alicuota: Ext.getCmp('alicuota').getValue(),
        saldoinmueble: Ext.getCmp('saldoinmueble').getValue(),
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

function Seleccionarpropietario() {
   Ext.getCmp('cedulapropietario').setValue(data.cedula);

     ventanacatalogopropietarios.close(); 
}

function catalogoperopietarios() {
/*  transportistasStore.load(); 
  if (transportistasStore.getTotalCount() <= 0 ) {
    Ext.Msg.alert("Error", "Tabla de Datos de Transportistas esta vacia!");
  }
  else {
  */ 
   //Instanciamos la ventana
   if (ventanacatalogopropietarios==null) {
    ventanacatalogopropietarios = Ext.create('miventanacatalogopropietarios');
   }
   //ventanacatalogopropietarios.setPosition(posx,posy);
   ventanacatalogopropietarios.show();
   
  //}

}

function nuevousuario(){
   //Instanciamos la ventana
    Ext.create('Ext.window.Window',{
            items: [
              {
                xtype: 'usuarioView'
              }
            ],
            autoScroll: true,
            maxHeight: 600
          }).show()
}
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
    Ext.define('App.MiPanel', {
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
          Ext.Msg.alert('Pronto','En construccion');
        }
        },{
        text: 'Eliminar',
        iconCls:'eliminar',
        handler:function() {
          Ext.Msg.alert('Pronto','En construccion');
        }
        }]
      }];
      App.MiPanel.superclass.initComponent.call(this);
    }
  });
Ext.define('Siaco.view.Inmueble', {
    extend: 'App.MiPanel',
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
        fieldLabel: 'Nombre Propietario',
        xtype: 'textfield',
        readOnly: 'true',
        name: 'nombrepropietario',
        id: 'nombrepropietario',
      },{
        fieldLabel: 'Estacionamiento',
        xtype: 'textfield',
        name: 'estacionamiento',
        id: 'estacionamiento'
      }
      ];
      this.callParent();
      Ext.getCmp('cedulapropietario').focus();
    }
  });
  
}); //FIN DEL ONREADY
function verpropietarios(){
    if (ventana33==null) {
    ventana33 = Ext.create('miVentana33');
   }
   //ventana.setPosition(posx,posy);
   ventana33.show();
   
}
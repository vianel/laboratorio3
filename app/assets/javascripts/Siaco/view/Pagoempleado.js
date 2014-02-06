var tabs = null;
var ventana = null;
Ext.onReady(function() {
  
  Ext.QuickTips.init();
//Definicion del Modelo
 Ext.define('Empleados', {
    extend: 'Ext.data.Model',
    fields: [ 'Nombre', 'Cedula', 'Tipo' ]
});

//Definicion del Data Store
var empleadosStore = Ext.create('Ext.data.Store', {
    model: 'Empleados',
    data: [
        { Nombre: 'Juan', Cedula: '123', Tipo: 'Conserje' },
        { Nombre: 'Marcos', Cedula: '234', Tipo: 'vigilante' },
        { Nombre: 'Samuel', Cedula: '345',  Tipo: 'vigilante' },
        { Nombre: 'Jorge', Cedula: '567',  Tipo: 'vigilante' },
  { Nombre: 'Maria', Cedula: '567',  Tipo: 'vigilante' },
  { Nombre: 'Sabrina', Cedula: '567',  Tipo: 'vigilante' },
  { Nombre: 'Cristiano', Cedula: '567',  Tipo: 'vigilante' },
  { Nombre: 'Demba ba', Cedula: '567',  Tipo: 'vigilante' }
    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.EmpleadosGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.empleadosgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Nombre", width: 120, dataIndex: 'Nombre', sortable: true},
            {text: "Cedula", flex: 1, dataIndex: 'Cedula', sortable: true},
            {text: "Tipo", width: 100, dataIndex: 'Tipo', sortable: true}
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
                         msg: 'El usuario seleccionado es: ' + usuario + '<br>' + 'La clave seleccionada es: ' + clave + '<br>' + 'El nivel seleccionado es: ' + nivel,
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
                       ventana.close();
                      }
                    }
                }     
    ]
  } ];
        // Origen de los datos, de un data store
        this.store = empleadosStore;
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
        this.callParent();
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miVentana', {
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
                title       : 'Catalogo de Empleados',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'empleadosgrid' }
                
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
            Ext.getCmp('mipanelpagoempleado').getForm().reset();
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
     this.callParent();
    }
  });
Ext.define('Siaco.view.Pagoempleado', {
    extend: 'App.MiPanel',
    xtype: 'pagoempleadoview',
    alias: 'widget.mipanelpagoempleados',
    id: 'mipanelpagoempleados',
    title: 'Pago Empleado',
    bodyPadding: 5,
    width: 450,
    
    initComponent: function () {
      
      this.items = [
     {
        fieldLabel: 'Empleado',
        xtype: 'textfield',
      //FALTA EL CATALOGO
        name: 'empleado',
        id: 'empleado'
      },{
             text: '...',
             xtype: 'button',
             id: 'catalogoempleados',
               iconCls: 'buscar',
             x: 260,
             y: -27,
            handler:function() {
          verempleados();
          }
      },{
        fieldLabel: 'Monto',
        xtype: 'textfield',
        name: 'monto',
        id: 'monto'
      },{
        fieldLabel: 'Vocuher',
        xtype: 'textfield',
        name: 'voucher',
        id: 'voucher'
      },{
        fieldLabel: 'Tipo de pago',
        xtype: 'combobox',
        name: 'tipodepago',
        id: 'tipodepago'
      },{
        fieldLabel: 'Fecha del deposito',
        xtype: 'datefield',
        name: 'fechadeldeposito',
        id: 'fechadeldeposito'
      }
      ];
      this.callParent();
      Ext.getCmp('empleado').focus();
    }
  });

}); //FIN DEL ONREADY
function verempleados(){
    if (ventana==null) {
    ventana = Ext.create('miVentana');
   }
   //ventana.setPosition(posx,posy);
   ventana.show();
   
}
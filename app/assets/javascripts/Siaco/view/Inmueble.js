var tabs = null;
var ventana33 = null;
var arregloareacomun = ['Caney de fiestas','Piscina'];
Ext.onReady(function() {
	
	Ext.QuickTips.init();
//Definicion del Modelo
 Ext.define('Propietarios', {
    extend: 'Ext.data.Model',
    fields: [ 'Nombre', 'Cedula', 'Inmuebles' ]
});

//Definicion del Data Store
var propietariosStore = Ext.create('Ext.data.Store', {
    model: 'Propietarios',
    data: [
        { Nombre: 'Juan', Cedula: '123', Inmuebles: '1' },
        { Nombre: 'Marcos', Cedula: '234', Inmuebles: '2' },
        { Nombre: 'Samuel', Cedula: '345',  Inmuebles: '2' },
        { Nombre: 'Jorge', Cedula: '567',  Inmuebles: '2' },
	{ Nombre: 'Maria', Cedula: '567',  Inmuebles: '2' },
	{ Nombre: 'Sabrina', Cedula: '567',  Inmuebles: '2' },
	{ Nombre: 'Cristiano', Cedula: '567',  Inmuebles: '2' },
	{ Nombre: 'Demba ba', Cedula: '567',  Inmuebles: '2' }
    ]
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
            {text: "Nombre", width: 120, dataIndex: 'Nombre', sortable: true},
            {text: "Cedula", flex: 1, dataIndex: 'Cedula', sortable: true},
            {text: "Inmuebles", width: 100, dataIndex: 'Inmuebles', sortable: true}
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
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Alicuota',
				xtype: 'textfield',
				name: 'alicuota',
				id: 'alicuota'
			},{
				fieldLabel: 'Condominio',
				xtype: 'combobox',
				name: 'condominio',
				id: 'condominio',
			},{
				fieldLabel: 'Propietario',
				xtype: 'textfield',
				name: 'propietario',
				id: 'propietario'
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
			}
			];
			this.callParent();
			Ext.getCmp('alicuota').focus();
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
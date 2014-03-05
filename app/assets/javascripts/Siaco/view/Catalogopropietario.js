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
//STORE DE Inmuebles PARA EL CATALOGO
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

Ext.define('Siaco.view.PropietariosGridcompleto', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.propietariosgridcompleto',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Cedula", flex: 1, dataIndex: 'cedula', sortable: true},
            {text: "Nombre", flex: 1, dataIndex: 'nombre', sortable: true},
            {text: "Apellido", width: 100, dataIndex: 'apellido', sortable: true},
            {text: "Fecha de nacimiento", flex: 1, dataIndex: 'fecha_nacimiento', sortable: true},
            {text: "Telefono", flex: 1, dataIndex: 'telefono', sortable: true},
            {text: "Celular", flex: 1, dataIndex: 'celular', sortable: true},
            {text: "Foto",  renderer:renderIcon, dataIndex: 'foto1', sortable: true},
            {text: "Estado Civil", flex: 1, dataIndex: 'estado_civil', sortable: true},
            {text: "Inmuebles" ,flex: 1, dataIndex: 'inmueble'},
            
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
Ext.define('Siaco.view.Catalogopropietario', {
    extend: 'Ext.form.Panel',
    xtype: 'catalogopropietarioview',
    alias: 'widget.catalogopropietarios',
    id: 'catalogopropietarios',
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
                title       : 'Catalogo de Propietarios',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'propietariosgridcompleto' }
                
                ]


            });

function renderIcon(val) {
    return '<img src="' + val + '" width="80", height="50">';
}
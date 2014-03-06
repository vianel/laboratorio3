
var tabs = null;
var foto_1 ="images/usuario.jpeg"
var RadiosSexo = new Ext.form.RadioGroup({
		fieldLabel: 'Sexo',
		id: 'sexo',
			
		columns: 2,
				items:
				[
				{boxLabel:'Masculino', name:'sexo'},
				{boxLabel:'Femenino', name:'sexo'}
				]
});
var EstadoCivil = new Ext.form.RadioGroup({
		fieldLabel: 'Estado Civil',
		id: 'estadocivil',
			
		columns: 2,
				items:
				[
				{boxLabel:'Soltero', name:'edocivil'},
				{boxLabel:'Casado', name:'edocivil'},
				{boxLabel:'Divociado', name:'edocivil'},
				{boxLabel:'Viudo', name:'edocivil'}
				
				]
});
var arregloestadocivil = ['Soltero','Casado','Divociado','Viudo'];
Ext.onReady(function() {
	
	Ext.QuickTips.init();
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
		Ext.define('App.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					id: 'btnlimpiar',
					handler: function() {
						Ext.getCmp('mipanelpropietarios').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				id: 'btngrabar',
				disabled: true,
				handler:function() {
					guardarpropietario();

					
					}
					/*
					var cedula = Ext.getCmp('cedula').getValue();
					var nombre = Ext.getCmp('nombre').getValue();
					var apellido = Ext.getCmp('apellido').getValue();
					var telefono = Ext.getCmp('telefono').getValue();					
					var correo = Ext.getCmp('correo').getValue();
					var sexo = Ext.getCmp('sexo').getValue();
					var fechanacimiento = Ext.getCmp('fechanacimiento').getValue();
					var estadocivil = Ext.getCmp('estadocivil').getValue();
					var direccion = Ext.getCmp('direccion').getValue();
					var login = Ext.getCmp('login').getValue();
					var contrasenna = Ext.getCmp('contrasenna').getValue();
					var cargojunta = Ext.getCmp('cargojunta').getValue();
					var foto = Ext.getCmp('imagen').getValue();
					var usuarioid = Ext.getCmp('login').getValue();
					//Ext.getCmp('mipanelpropietarios').fireEvent('insertar', cedula ,nombre,apellido,telefono,correo,sexo,fechanacimiento,estadocivil,direccion,login,cargojunta,foto,usuarioid)
					
					propietario = Ext.create('Siaco.model.Propietario')
        
			        propietario.set('CEDULA', cedula)
			        propietario.set('NOMBRE', nombre)
			        propietario.set('APELLIDO', apellido)
			        propietario.set('TELEFONO', telefono)
			        propietario.set('EMAIL', correo)
			        propietario.set('SEXO', sexo)
			        propietario.set('FECHA_NACIMIENTO', fechanacimiento)
			        propietario.set('ESTADO_CIVIL', estadocivil)
			        propietario.set('DIRECCION_ALTERNATIVA', direccion)
			        propietario.set('LOGIN', login)
			        propietario.set('CONTRASENNA', contrasenna)
			        propietario.set('CARGO_JUNTA_ONDOMINIO_ID', cargojunta)
			        propietario.set('FOTO', foto)
			        propietario.set('CONDOMINIO_ID', '1')
			        propietario.set('USUARIOS_ID', usuarioid)
        
        
        storeP = Ext.getStore('propietariosStore')
        storeP.add(propietario)
        storeP.sync()
        Ext.Msg.alert('Exitoso','Guardado satisfactoriamente')*/

				
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
				id: 'btneliminar',
				disabled: true,
				handler:function() {
					eliminarprop();
				}
				},{
		             text: '...',
		             xtype: 'button',
		               iconCls: 'buscar',
		             id: 'catalogopropietarios',
			            handler:function() {
			          catalogoperopietarios();
			          			}
		      			}]
			}];
			App.MiPanel.superclass.initComponent.call(this);
		}
	});
Ext.define('Siaco.view.ActualizarPropietario', {
		extend: 'App.MiPanel',
		xtype: 'actualizarpropietarioview',		
		alias: 'widget.mipanelpropietarios',
		title: 'Panel Propietario',
		id: 'mipanelpropietarios',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Cedula',
				xtype: 'textfield',
				name: 'cedula',
				id: 'cedula'
			},{
	               text: 'SAIME',
	               xtype: 'button',
	               id: 'saime',
	               x: 260,
	               y: -27,
		           handler:function() {
		              saime();
		        }
          	},{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombre'
			},{
				fieldLabel: 'Apellido',
				xtype: 'textfield',
				name: 'apellido',
				id: 'apellido'
			},{
				fieldLabel: 'Telefono',
				xtype: 'textfield',
				name: 'telefono',
				id: 'telefono'
			},{
				fieldLabel: 'Celular',
				xtype: 'textfield',
				name: 'celular',
				id: 'celular'
			},{
				fieldLabel: 'Fecha de Nacimiento',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechanacimiento',
				id: 'fechanacimiento',
			},{
		        xtype:'combobox',
		        id : 'edocivil',
		        fieldLabel: 'Estado civil',
		        store: arregloestadocivil
		    },{
				fieldLabel: 'Direccion Alternativa',
				xtype: 'textarea',
				name: 'direccion',
				id: 'direccion'
			},{
				fieldLabel: 'Correo electronico',
				xtype: 'textfield',
				name: 'correo',
				id: 'correo'
			},{
		         fieldLabel: 'Imagen',
		         xtype: 'textfield',
		          x: 5,
		         y: 210,
		         width: 400 
		        },{
		         xtype: 'textfield',
		         id: 'imagen',
		         x: 110,
		         y: 210,
		         emptyText: foto_1,
		         disabled: true,
		       //  width: 295
		        },{
		          xtype: 'image',
		          id: 'imagen0',
		          x: 110,
		          y: 240,
		          border: '',
		          frame: true,
		          height: 110,
		        //  width: 130,
		          src: foto_1,
		        },{
		         id: 'imagen1',
		         border: '',
		        /* x: 110,
		         y: 360,*/
		         //atributo accept en algunos navegadores funciona 
		         //para firefox no, accept="image/gif, image/jpeg"
		         html: '<input type="file" size="100" name="ufile[]" id="afile" onchange="previewImage(this)" />',
		        }
	
			];
			this.callParent();
			Ext.getCmp('cedula').focus();
		}
	});
}); //FIN DEL ONREADY



function guardarpropietario()
{


		Ext.Ajax.request({
     url: 'propietarios/grabarpropietario',
	// method: 'POST',
     //Enviando los parametros a la pagina servidora
     params: {
      ajax: 'true',
      funcion: 'grabarpropietario',

	 nombre: Ext.getCmp('nombre').getValue(),
	 apellido: Ext.getCmp('apellido').getValue(),
	 cedula: Ext.getCmp('cedula').getValue(),
	 fechanacimiento: Ext.getCmp('fechanacimiento').getValue(),
	 direccion: Ext.getCmp('direccion').getValue(),
	 telefono: Ext.getCmp('telefono').getValue(),	
	 celular: Ext.getCmp('celular').getValue(),				
     imagen1: encodeURIComponent(document.getElementsByName('ufile[]')[0].value),
	 ufile: document.getElementById('imagen0').src,
	 estadocivil: Ext.getCmp('edocivil').getValue(),
	 correo: Ext.getCmp('correo').getValue(),

     },
     //Retorno exitoso de la pagina servidora a traves del formato JSON
     success: function( resultado, request ) {
      datos=Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert('Exito', datos.msg);
      Ext.getCmp('mipanelpropietarios').getForm().reset();
     },
     //No hay retorno de la pagina servidora
     failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado!");
     }
    });
}

function saime()
{
       Ext.Ajax.request({
     url: 'propietarios/obtenerPersona',
	       method: 'GET',
     //Enviando los parametros a la pagina servidora
     params: {
      ajax: 'true',
      funcion: 'obtenerPersona',
      cedula: Ext.getCmp('cedula').getValue()
     },
     //Retorno exitoso de la pagina servcedulaora a traves del formato JSON
     success: function( resultado, request ) {
      datos=Ext.JSON.decode(resultado.responseText);
      if (datos.exito=='true') {
      Ext.Msg.alert("Exito", "La Persona esta registrada en el SAIME y sus datos son los siguientes:");
       Ext.getCmp('cedula').setValue(datos.cedula);
       Ext.getCmp('nombre').setValue(datos.nombre);
       Ext.getCmp('apellido').setValue(datos.apellido);
       Ext.getCmp('telefono').setValue(datos.telefono);
       Ext.getCmp('fechanacimiento').setValue(datos.fechanacimiento);
       Ext.getCmp('direccion').setValue(datos.direccion);
       Ext.getCmp('correo').setValue(datos.correo);
       Ext.getCmp('edocivil').setValue(datos.estadocivil);
       Ext.getCmp('btngrabar').enable(true);

      }
      else {
       Ext.Msg.alert("Error", datos.msg);
      }
     },
     //No hay retorno de la pagina servidora
     failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado");
     }
    }); 
}

function Seleccionarpropietario() {
   Ext.getCmp('cedula').setValue(data.cedula);
   Ext.getCmp('nombre').setValue(data.nombre),
   Ext.getCmp('apellido').setValue(data.apellido),
   Ext.getCmp('fechanacimiento').setValue(data.fecha_nacimiento),
   Ext.getCmp('direccion').setValue(data.direccion_alternativa),
   Ext.getCmp('telefono').setValue(data.telefono),	
   Ext.getCmp('celular').setValue(data.celular),
   Ext.getCmp('correo').setValue(data.correo),
   Ext.getCmp('edocivil').setValue(data.estado_civil)	
   document.getElementById('afile').innerHtml = data.imagen;
   Ext.getCmp('imagen0').setSrc(data.foto1);
	 Ext.getCmp('btneliminar').enable(true);
	 ventanacatalogopropietarios.close(); 
}

function eliminarprop() {
   			var loadingMask = new Ext.LoadMask(Ext.getBody(), { msg: "eliminando..." });
                 loadingMask.show();
	       Ext.Ajax.request({
	    	 url: '/propietarios/eliminar',
			 method: 'GET',
	         //Enviando los parametros a la pagina servidora
	         params: {
	              ajax: 'true',
	              funcion: 'eliminar',
	              cedula: Ext.getCmp('cedula').getValue()
	         },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
			 loadingMask.hide();
              datos=Ext.JSON.decode(resultado.responseText);
              Ext.Msg.alert('Mensaje', datos.msg);
			  Ext.getCmp('mipanelpropietarios').getForm().reset();
			   Ext.getCmp('btngrabar').enable(false);
			   Ext.getCmp('btneliminar').enable(false);

             },
             //No hay retorno de la pagina servidora
                     failure: function(f,a){
					     loadingMask.hide();
                         if (a.failureType === Ext.form.Action.CONNECT_FAILURE){
                             Ext.Msg.alert('Error', 'El servidor reporta:'+a.response.status+' '+a.response.statusText);
                         }
                         if (a.failureType === Ext.form.Action.SERVER_INVALID){
                            Ext.Msg.alert('Advertencia', a.result.errormsg);
                         }
                     }
            });



   }
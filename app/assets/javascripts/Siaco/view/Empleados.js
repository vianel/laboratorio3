var tabs = null;
var ventanatipoempleado=null;
var foto_1 ="images/usuario.jpeg"
var RadiosSexo = new Ext.form.RadioGroup({
		fieldLabel: 'Sexo',
			
		columns: 2,
				items:
				[
				{boxLabel:'Masculino', name:'sexo'},
				{boxLabel:'Femenino', name:'sexo'}
				]
});
var EstadoCivil = new Ext.form.RadioGroup({
		fieldLabel: 'Estado Civil',
			
		columns: 2,
				items:
				[
				{boxLabel:'Soltero', name:'edocivil'},
				{boxLabel:'Casado', name:'edocivil'},
				{boxLabel:'Divociado', name:'edocivil'},
				{boxLabel:'Viudo', name:'edocivil'}
				
				]
});
var arreglotipoempleados = ['Jardinero','Conserje'];
Ext.onReady(function() {
	
	Ext.QuickTips.init();

//SERVICIO CEDULA

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
			    enviar(Ext.getCmp('id_cedrif').value);
			  }
			}
		      }]
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
						Ext.getCmp('mipanelempleados').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					dialogo.show();
				}
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
				handler:function() {
					
					Ext.Msg.alert('Pronto','En construccion');
				}
				},{
					text: 'Validar',
					handler: function() {
						dialogo.show();
					}
				}

				]
			}];
			this.callParent();
		}
	});
Ext.define('Siaco.view.Empleados', {
		extend: 'App.MiPanel',
		xtype: 'empleadosview',
		alias: 'widget.mipanelempleados',
		id: 'mipanelempleados',
		title: 'Panel Empleados',
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
				fieldLabel: 'Direccion Alternativa',
				xtype: 'textarea',
				name: 'direccion',
				id: 'direccion'
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
				fieldLabel: 'Correo',
				xtype: 'textfield',
				name: 'correo',
				id: 'correo'
			},RadiosSexo,{
				fieldLabel: 'Fecha de Nacimiento',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechanacimiento',
				id: 'fechanacimiento',
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
		        },
			EstadoCivil,{
				fieldLabel: 'Usuario',
				xtype: 'textfield',
				name: 'usuario',
				id: 'usuario'
			},{
				fieldLabel:'Tipo Empleado',
				xtype: 'combobox',
				name: 'tipoempleado',
				id: 'tipoempleado',
				store: arreglotipoempleados
			},  {
		         text: '...',
		         xtype: 'button',
		         id: 'catalogo',
		         iconCls: 'buscar',
		         x: 260,
		         y: -27,
		        handler:function() {
					vernuevotipoempleado();
				}
        		},{
				fieldLabel: 'Numero de Hijos',
				xtype: 'textfield',
				name: 'nrohijos',
				id: 'nrohijos'
			},{
				fieldLabel: 'Cargo',
				xtype: 'textfield',
				name: 'cargo',
				id: 'cargo'
			},{
				fieldLabel: 'Fecha de ingreso',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechaingreso',
				id: 'fechaingreso',
			},{
				fieldLabel: 'Inicio jornada',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'iniciojornada',
				id: 'iniciojornada',
			},{
				fieldLabel: 'Fin jornada',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'finjornada',
				id: 'finjornada',
			}
			
			];
			this.callParent();
			Ext.getCmp('cedula').focus();
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
            enviar(Ext.getCmp('id_cedrif').value);  
          }  
        }  
          }]  
     });  
     //dialogo.show(); 


}); //FIN DEL ONREADY
function vernuevotipoempleado(){
	Ext.create('Ext.window.Window',{
		    		items: [
		    			{
		    				xtype: 'tipoempleadoview'
		    			}
		    		],
		    		autoScroll: true,
		    		maxHeight: 600
		    	}).show()
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

      


    
   }
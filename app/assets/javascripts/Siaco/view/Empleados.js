var tabs = null;
var ventanatipoempleado=null;
var foto_1 ="images/usuario.jpeg"

var arregloestadocivil = ['Soltero','Casado','Divociado','Viudo'];
//MODELO PARA ELCOMBOBOX DE TIPOEMPLEADOS
Ext.define('Tipoempleado', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'codigo_tipo_empleado', type: 'string'},
            {name: 'condominio_id', type: 'string'},
            {name: 'nombre', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'tipoempleados/buscar'
           }
});


//Definicion del Data Store
var tipoempleadoStore = Ext.create('Ext.data.Store', {
    model: 'Tipoempleado',
    autoLoad: true,
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
				id: 'btngrabar',
				handler:function() {
					guardarempleado();
			
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
				name: 'cedulaempleado',
				id: 'cedulaempleado'
			},{
	               text: 'SAIME',
	               xtype: 'button',
	               id: 'saime',
	               x: 260,
	               y: -27,
		           handler:function() {
		              saimeempleado();
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
			},{
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
		        },{
		        xtype:'combobox',
		        id : 'edocivil',
		        fieldLabel: 'Estado civil',
		        store: arregloestadocivil
		    },{
				        xtype:'combobox',
				        id : 'tipoempleado',
				        fieldLabel: 'Tipo Empleado',
				        store: tipoempleadoStore,
				        valueField: 'id',
				        displayField: 'nombre',   
				        queryMode: 'remote',
				        typeAhead: true,
				        emptyText:'Seleccionar',
				        triggerAction: 'all',
				        selecOnFocus: true
				      },  {
		         text: '...',
		         xtype: 'button',
		         id: 'nuevotipoempleado',
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
				fieldLabel: 'Inicio jornada',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'iniciojornada',
				id: 'iniciojornada'
			},{
				fieldLabel: 'Fin jornada',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'finjornada',
				id: 'finjornada'
			}
			
			];
			this.callParent();
			Ext.getCmp('cedulaempleado').focus();
		}
	});




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
		    	}).show();
}
function guardarempleado()
{
	   		Ext.Ajax.request({
	     url: 'empleados/grabar',
	//	 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      cedula: Ext.getCmp('cedulaempleado').getValue(),
	      nombre: Ext.getCmp('nombre').getValue(), //obtiene el valor a traves del id del campo
	      apellido: Ext.getCmp('apellido').getValue(),
		  direccion: Ext.getCmp('direccion').getValue(),
		  telefono: Ext.getCmp('telefono').getValue(),
		  celular: Ext.getCmp('celular').getValue(),
		  correo: Ext.getCmp('correo').getValue(),
		  sexo: Ext.getCmp('sexo').getValue(),
		  fechanacimiento: Ext.getCmp('fechanacimiento').getValue(),      
	      imagen1: encodeURIComponent(document.getElementsByName('ufile[]')[0].value),
		  ufile: document.getElementById('imagen0').src,
	      edocivil: Ext.getCmp('edocivil').getValue(),
	      tipoempleado: Ext.getCmp('tipoempleado').getValue(),
	      nrohijos: Ext.getCmp('nrohijos').getValue(),
		  iniciojornada: Ext.getCmp('iniciojornada').getValue(),
	      finjornada: Ext.getCmp('finjornada').getValue(),
	     	     	     

	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelempleados').getForm().reset();
	       document.getElementsByName('ufile[]')[0].value='';
			Ext.getCmp('imagen0').setSrc(fotoarbol);
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });


}

function saimeempleado()
{
       Ext.Ajax.request({
     url: 'empleados/obtenerempleado',
	       method: 'GET',
     //Enviando los parametros a la pagina servidora
     params: {
      ajax: 'true',
      funcion: 'obtenerempleado',
      cedula: Ext.getCmp('cedulaempleado').getValue()
     },
     //Retorno exitoso de la pagina servcedulaora a traves del formato JSON
     success: function( resultado, request ) {
      datos=Ext.JSON.decode(resultado.responseText);
      if (datos.exito=='true') {
      Ext.Msg.alert("Exito", "La Persona esta registrada en el SAIME y sus datos son los siguientes:");
       Ext.getCmp('cedulaempleado').setValue(datos.cedula);
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
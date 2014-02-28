var tabs = null;
var typeExtension="image";
 var foto_1 = "images/usuario.jpeg";

var EstadoCivil = new Ext.form.RadioGroup({
		fieldLabel: 'Estado Civil',
		id:'edocivil',
			
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
     //Usando html5
   function previewImage(input) {
   	typeExtension="image";
   	if (!checkFileExtension(encodeURIComponent(document.getElementsByName("ufile[]")[0].value)))
   	{
   	 return false;	
   	}
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
       document.getElementById('imagen0').src = e.target.result
      }
      reader.readAsDataURL(input.files[0]);
    }
   }
Ext.onReady(function() {
	
	Ext.QuickTips.init();


//MODELO
Ext.define('Condominio', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'codigo', type: 'string'}, 
            {name: 'nombre', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'condominios/buscar'
           }
});


//Definicion del Data Store
var condominioStore = Ext.create('Ext.data.Store', {
    model: 'Condominio',
    autoLoad: true,
});

	Ext.define('Siaco.view.MiPanelAdministrador', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipaneladministrador').getForm().reset();
						
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				id: 'grabaradmin',
				disabled: true,
				handler:function() {

					guardaradmin();
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
	Ext.define('Siaco.view.Administrador', {
		extend: 'Siaco.view.MiPanelAdministrador',
		xtype: 'administradorview',
		alias: 'widget.mipaneladministrador',
		title: 'Panel Administrador',
		id: 'mipaneladministrador',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Usuario',
				xtype: 'textfield',
				name: 'usuario',
				id: 'usuarioadmin'
			},{
				fieldLabel: 'Contraseña',
				xtype: 'textfield',
				name: 'contrasenna',
				id: 'contrasennaadmin'
			},{
	               text: 'Validarusuario',
	               xtype: 'button',
	               id: 'validar',
	               x: 260,
	               y: -27,
		           handler:function() {
		          guardarusuario();
		        }
          	},{
				xtype:'combobox',
                id : 'condominioadmin',
                fieldLabel: 'Condominio',
                store: condominioStore,
                valueField: 'id',
                displayField: 'nombre',   
                queryMode: 'remote',
                typeAhead: true,
                emptyText:'Seleccionar',
                triggerAction: 'all',
                selecOnFocus: true
			},{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombreadmin'
			},{
				fieldLabel: 'Apellido',
				xtype: 'textfield',
				name: 'apellido',
				id: 'apellidoadmin'
			},{
				fieldLabel: 'Cedula',
				xtype: 'textfield',
				name: 'cedula',
				id: 'cedulaadmin'
			},{
				fieldLabel: 'Fecha de Nacimiento',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechanacimiento',
				id: 'fechanacimientoadmin',
			},{
				fieldLabel: 'Direccion Alternativa',
				xtype: 'textarea',
				name: 'direccion',
				id: 'direccionadmin'
			},{
				fieldLabel: 'Telefono',
				xtype: 'textfield',
				name: 'telefono',
				id: 'telefonoadmin'
			},{
				fieldLabel: 'Celular',
				xtype: 'textfield',
				name: 'celular',
				id: 'celularadmin'
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
				fieldLabel: 'Correo electronico',
				xtype: 'textfield',
				name: 'correoadmin',
				id: 'correoadmin'
			},{
				fieldLabel: 'Sueldo',
				xtype: 'textfield',
				name: 'sueldo',
				id: 'sueldoadmin'
			},{
				fieldLabel: 'Fecha de contrato',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechacontrato',
				id: 'fechacontratoadmin',
			}
			];
			this.callParent();
			Ext.getCmp('nombreadmin').focus();
		}
	});
	
	
}); //FIN DEL ONREADY


function guardaradmin() {
	Ext.Ajax.request({
	     url: 'administradores/grabaradmin',
	     method: 'POST',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabaradmin',

	      usuario: Ext.getCmp('usuarioadmin').getValue(), //obtiene el valor a traves del id del campo
	      condominio: Ext.getCmp('condominioadmin').getValue(),
	      nombre: Ext.getCmp('nombreadmin').getValue(),
	      apellido: Ext.getCmp('apellidoadmin').getValue(),
	      cedula: Ext.getCmp('cedulaadmin').getValue(),
	      fechanacimiento: Ext.getCmp('fechanacimientoadmin').getValue(),
	      direccion: Ext.getCmp('direccionadmin').getValue(),
	      telefono: Ext.getCmp('telefonoadmin').getValue(),
	      celular: Ext.getCmp('celularadmin').getValue(),
	      imagen1: encodeURIComponent(document.getElementsByName('ufile[]')[0].value),
		  ufile: document.getElementById('imagen0').src,
	      edocivil: Ext.getCmp('edocivil').getValue(),
	      sueldo: Ext.getCmp('sueldoadmin').getValue(),
	      fechacontrato: Ext.getCmp('fechacontratoadmin').getValue(),
	      correo: Ext.getCmp('correoadmin').getValue(),
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipaneladministrador').getForm().reset();
	       document.getElementsByName('ufile[]')[0].value='';
			Ext.getCmp('imagen0').setSrc(foto_1);
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
};

function guardarusuario() {
  Ext.Ajax.request({
    url: "usuarios/grabarusuario",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "grabarusuario",
      login: Ext.getCmp("usuarioadmin").getValue(),
      password: Ext.getCmp("contrasennaadmin").getValue(),
      rol: "Administrador",

    },
    success: function(resultado, request) {
      var datos;
      datos = Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert("Exito", datos.msg);
	      if (datos.msg != "Ese usuario ya existe")
	      {
	  	    Ext.getCmp('grabaradmin').enable();
	  	  }
    },
    failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado!");
    }
  });
};
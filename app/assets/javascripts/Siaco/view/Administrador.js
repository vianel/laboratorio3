var tabs = null;
var typeExtension="image";
 var foto_1 = "images/usuario.jpeg";
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
//Funcion para validar la extension
   function checkFileExtension(elem) {
        var filePath = elem;

        if(filePath.indexOf('.') == -1)
            return false;
                  
        var validExtensions = new Array();
        var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
    
        if (typeExtension=="image") {
         validExtensions[0] = 'jpg';
         validExtensions[1] = 'jpeg';
         validExtensions[3] = 'png';
         validExtensions[4] = 'gif'; 
        }
        else {
         validExtensions[0] = 'pdf';
        }   

        for(var i = 0; i < validExtensions.length; i++) {
            if(ext == validExtensions[i])
                return true;
        }

        Ext.Msg.alert('Advertencia', 'La extension .'+ext+' del archivo ' + filePath + ' no es permitida!');
        if (typeExtension=="image") {
         document.getElementsByName('ufile[]')[0].value='';
         Ext.getCmp('imagen0').setSrc('images/transporte.jpg'); 
        }
        else {
         document.getElementsByName('ufile1[]')[0].value='';
         Ext.getCmp('imagen0').setSrc('helloworld.pdf');	
        } 
        return false;
    }
    
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
	Ext.define('App.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelpersonales').getForm().reset();
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
	Ext.define('Siaco.view.Administrador', {
		extend: 'App.MiPanel',
		xtype: 'administradorview',
		alias: 'widget.mipanelpersonales',
		id: 'mipanelpersonales',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombre'
			},{
				fieldLabel: 'Contraseña',
				xtype: 'textfield',
				name: 'contrasenna',
				id: 'contrasenna'
			},{
				fieldLabel: 'Correo',
				xtype: 'textfield',
				name: 'correo',
				id: 'correo'
			},{
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
			},EstadoCivil,{
				fieldLabel: 'Direccion',
				xtype: 'textarea',
				name: 'direccion',
				id: 'direccion'
			},{
				fieldLabel: 'Sueldo',
				xtype: 'textfield',
				name: 'sueldo',
				id: 'sueldo'
			},{
				fieldLabel: 'Observacion',
				xtype: 'textarea',
				name: 'observacion',
				id: 'observacion'
			},{
				fieldLabel: 'Fecha de Nacimiento',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechanacimiento',
				id: 'fechanacimiento',
			},{
				fieldLabel: 'Fecha de Ingreso',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechaingreso',
				id: 'fechaingreso',
			},{
				fieldLabel: 'Fecha de Culminacion',
				//xtype: 'datepicker',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechaculminacion',
				id: 'fechaculminacion',
			},
			RadiosSexo,{
				fieldLabel: 'Telefono',
				xtype: 'textfield',
				name: 'telefono',
				id: 'telefono'
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
			Ext.getCmp('nombre').focus();
		}
	});
	
	
}); //FIN DEL ONREADY
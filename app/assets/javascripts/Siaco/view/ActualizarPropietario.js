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
						Ext.getCmp('mipanelpropietarios').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					var form = this.up('form').getForm();
					if (form.isValid())
					{
					var loadingMask = new Ext.LoadMask(Ext.getBody(), {msg: "Guardando"});
					loadingMask.show();

					form.submit({
						params: {
							ajax: 'true',
							funcion:'grabar',

					 nombre: Ext.getCmp('nombre').getValue(),
					 apellido: Ext.getCmp('apellido').getValue(),
					 telefono: Ext.getCmp('telefono').getValue(),					
					 correo: Ext.getCmp('correo').getValue(),
					 sexo: Ext.getCmp('sexo').getValue(),
					 fechanacimiento: Ext.getCmp('fechanacimiento').getValue(),
					 estadocivil: Ext.getCmp('estadocivil').getValue(),
					 direccion: Ext.getCmp('direccion').getValue(),
					 login: Ext.getCmp('login').getValue(),
					// contrasenna: Ext.getCmp('contrasenna').getValue(),
					 cargojunta: Ext.getCmp('cargojunta').getValue(),
					 foto: Ext.getCmp('imagen').getValue()


						},
						url: 'propietarios/grabar',
						method: 'POST',
						success: function(form, action){
							loadingMask.hide();
							Ext.Msg.alert('Exitoso','Guardado satisfactoriamente')

						}
					})
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
			},EstadoCivil,{
				fieldLabel: 'Direccion Alternativa',
				xtype: 'textarea',
				name: 'direccion',
				id: 'direccion'
			},{
				fieldLabel: 'Login',
				xtype: 'textfield',
				name: 'login',
				id: 'login'
			},{
				fieldLabel: 'Contraseña',
				xtype: 'textfield',
				name: 'contrasenna',
				id: 'contrasenna'
			},{
				fieldLabel: 'Cargo en la junta',
				xtype: 'combobox',
				name: 'cargojunta',
				id: 'cargojunta'
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
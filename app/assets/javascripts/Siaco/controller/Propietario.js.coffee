Ext.define "Siaco.controller.Propietario",
	extend: "Ext.app.Controller"
	refs: [
		{
			ref: 'actualizarpropietarioview'
			selector: 'actualizarpropietarioview'
		}
	]

	init: ->
		@control
			'actualizarpropietarioview':
                modificar: @onModificar
                insertar: @onInsertar
                eliminar: @onEliminar
    
    onModificar: ->
	    # Bla bla bla
    onInsertar: (CEDULA, NOMBRE, APELLIDO, DIRECCION_ALTERNATIVA, TELEFONO, EMAIL, SEXO, FECHA_NACIMIENTO, ESTADO_CIVIL, FOTO, CONDOMINIO_ID, USUARIOS_ID, CARGO_JUNTA_ONDOMINIO_ID) ->
    
        propietario = Ext.create('Siaco.model.Propietario')
        
        propietario.set('CEDULA', CEDULA)
        propietario.set('NOMBRE', NOMBRE)
        propietario.set('APELLIDO', APELLIDO)
        propietario.set('TELEFONO', TELEFONO)
        propietario.set('EMAIL', EMAIL)
        propietario.set('SEXO', SEXO)
        propietario.set('FECHA_NACIMIENTO', FECHA_NACIMIENTO)
        propietario.set('ESTADO_CIVIL', ESTADO_CIVIL)
        propietario.set('DIRECCION_ALTERNATIVA', DIRECCION_ALTERNATIVA)
        propietario.set('LOGIN', LOGIN)
        propietario.set('CONTRASENNA', CONTRASENNA)
        propietario.set('CARGO_JUNTA_ONDOMINIO_ID', CARGO_JUNTA_ONDOMINIO_ID)
        propietario.set('FOTO', FOTO)
        propietario.set('CONDOMINIO_ID', CONDOMINIO_ID)
        propietario.set('USUARIOS_ID', USUARIOS_ID)
        
        
        storeP = Ext.getStore('propietariosStore')
        storeP.add(propietario)
        storeP.sync()
        Ext.Msg.alert('Exitoso','Guardado satisfactoriamente')

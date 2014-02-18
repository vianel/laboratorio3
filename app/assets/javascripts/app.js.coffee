Ext.application
    name: 'Siaco'
    views: [
        'Arbol'
        'Empleados'
        'Condominio'
        'ServicioComun'
        'TipoServicioComun'
        'TipoEmpleado'
        'Tiposancion'
        'Areacomun'
        'Inmueble'
        'Pagarcondominio'
        'Sancion'
        'Administrador'
        'Pagoempleado'
        'Sugerencia'
        'Reservacion'
        'Factura'
        'Usuario'
        'ActualizarPropietario'
        'Noticia'
        'VistaCuriosa'
        'Vision'
        'Tabpanelingresoreservacion'
        'Ingreso'
    ]
    controllers: ['Login']
    stores: ['Arboles','Facturas','Areascomunes','Propietarios','Sanciones']
    model: ['Empleado','Factura','Areacomun','Propietario','Sancion']
    appFolder: 'assets/Siaco'
    autoCreateViewport: true

    launch: ->
    	Ext.create('Ext.window.Window',
    		items: [
                {
                #Aqui mande a aparecer la vista curiosa 
                    xtype: 'vistacuriosaview'
                }
    		]
    	).show().center()
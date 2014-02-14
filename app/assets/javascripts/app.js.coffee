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
        'ActualizarPropietario'
        'Noticia'
        'VistaCuriosa'
        'Vision'
    ]
    controllers: ['Login']
    stores: ['Arboles','Facturas','Areascomunes','Propietarios']
    model: ['Empleado','Factura','Areacomun','Propietario']
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
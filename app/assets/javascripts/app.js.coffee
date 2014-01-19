Ext.application
    name: 'Siaco'
    views: ['Inventario', 'Arbol','Empleados', 'Condominio','Licencia','Renovacion','ComprobantePagoLicencia','Agenda','ServicioComun','TipoServicioComun']
    controllers: ['Login']
    stores: ['Arboles']
    appFolder: 'assets/Siaco'
    autoCreateViewport: true

    launch: ->
    	Ext.create('Ext.window.Window',
    		items: [
    			{
    				xtype: 'loginView'
    			}
    		]
    	).show().center()

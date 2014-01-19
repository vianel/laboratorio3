Ext.application
    name: 'Siaco'
    views: ['Inventario', 'Arbol','Condominio','Licencia','Renovacion','ComprobantePagoLicencia','Agenda','ServicioComun','TipoServicioComun']
    stores: ['Arboles']
    appFolder: 'assets/Siaco'
    #autoCreateViewport: true
    launch: ->
    	Ext.create('Ext.window.Window',
    		items: [
    			{
    				xtype: 'serviciocomunView'
    			}
    		]
    	).show()

    
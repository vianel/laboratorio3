Ext.application
    name: 'Siaco'
    views: ['Inventario', 'Arbol','Empleados']
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
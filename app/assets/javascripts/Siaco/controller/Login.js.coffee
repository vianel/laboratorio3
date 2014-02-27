Ext.define "Siaco.controller.Login",
	extend: "Ext.app.Controller"
	refs: [
		{
			ref: 'loginView'
			selector: 'loginView'
		}
		{
			ref: 'mainViewport'
			selector: 'mainViewport'
		}
	]

	init: ->
		@control
			'loginView':
				login: @onLogin

	onLogin: (usuario, clave) ->
		Ext.Ajax.request
			url: 'sesiones/entrar'
			method: 'POST'
			params:
				login: usuario
				password: clave
			success: (resultado, request) =>
				datos = Ext.JSON.decode(resultado.responseText)
				if datos.exito
					
					arbolView = Ext.create 'widget.arbolView',
						title: 'SIACO Menú'
						collapsible: false
						width: 250
						minWidth: 100
						region:'west'
					arbolView.getStore().load
						params:
							tipo: 1
							padre_id: 1
					panelderechoView = Ext.create 'widget.panelderechoView',
						region: 'east'
						widt: 100
					btnsalir = Ext.create "Ext.Button",
						text:'SALIR'
						iconCls:'eliminar'
						region: 'south'
						handler: ->
    					  window.location.reload()
					@getMainViewport().add(arbolView)
					@getMainViewport().add(panelderechoView)
					@getMainViewport().add(btnsalir)
					@getLoginView().up().hide()
					
				else
				 Ext.Msg.alert("Error", "Usuario o clave incorrecta!")
			failure: ->
				Ext.Msg.alert("Error", "Servidor no conectado")
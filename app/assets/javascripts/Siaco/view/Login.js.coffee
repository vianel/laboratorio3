Ext.define 'Siaco.view.Login',
	extend: 'Ext.form.Panel'
	xtype: 'loginView'
	alias: 'widget.loginView'
	bodyPadding: 5
	width: 350

	initComponent: ->
		@dockedItems = [{
			dock: 'bottom'
			buttons: [
				{
					text: 'Ir a Pagina Principal'
					handler: ->
				 		location.href=""
				}
				{
					text: 'Limpiar'
					iconCls:'limpiar'
					handler: ->
						@up('form').getForm().reset()
						Ext.getCmp('usuario').focus()
				}
				{
				 text: 'Enviar'
				 formBind: true # Disponible hasta que los campos esten validados
				 disabled: true
				 handler: ->
				 	form = @up('form')
				 	usuario = @up('form').down('#usuario').getValue()
				 	clave = @up('form').down('#clave').getValue()
				 	form.fireEvent('login', usuario, clave)
				}
			]
		}]
		@callParent()

	items: [
		{
			fieldLabel: 'Usuario'
			xtype: 'textfield'
			name: 'usuario'
			id: 'usuario'
			allowBlank: false
		}
		{
			fieldLabel: 'Clave'
			xtype: 'textfield'
			name: 'clave'
			id: 'clave'
			inputType: 'password'
			allowBlank: false
		}
	]

	enviar: ->
		@trigger('login')
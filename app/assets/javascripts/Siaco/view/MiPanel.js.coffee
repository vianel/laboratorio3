	Ext.define 'Siaco.view.MiPanel', 
		extend: 'Ext.form.Panel'

		
		initComponent: -> 
			@dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar'
					iconCls:'limpiar'
					handler: ->
						@getForm().reset()
					
					
				},{
				text: 'Grabar'
				iconCls:'grabar'
				handler: ->
					Ext.Msg.alert('Pronto','En construccion')
				
				},{
				text: 'Eliminar'
				iconCls:'eliminar'
				handler: ->
					Ext.Msg.alert('Pronto','En construccion')
				
				}]
			}]
			@callParent()
		
	
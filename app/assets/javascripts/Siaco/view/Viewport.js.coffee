Ext.define 'Siaco.view.Viewport',
	extend: 'Ext.container.Viewport'

	layout:'border'
	defaults:
		border: false
	items: [
		{
			collapsible: false
			region:'north'
			height: '150px'
			items: [
				{
					xtype: 'image'
					src: 'images/Banner.jpg'
					width: '100%'
					height: '150px'
				}
			]
		}
		{
			xtype: 'vistaarbol'
			title: 'SIACO Menú'
			collapsible: false
			width: 250
			minWidth: 100
			region:'west'
		}
		{
			id: 'contenedor'
			collapsible: false
			region: 'center'
		}
		{
			region: 'south'
			items: [
				{
					xtype: 'label'
					html: '&#169; SIACO 2013 &copy; Todos los derechos reservados'
				}
			]
		}
	]


Ext.define 'Siaco.view.Viewport',
	extend: 'Ext.container.Viewport'
	alias: 'widget.mainViewport'
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
			id: 'contenedor'
			collapsible: false
			region: 'center'
			layout: 'fit'
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


Ext.define 'Siaco.store.Sanciones',
	storeId: 'sancionesStore'
	extend: 'Ext.data.Store'
	model: 'Siaco.model.Sancion'
	proxy:
		type: "ajax"
		url: "sanciones/catalogo"
		reader:
	  		type: "json"
	  		root: "datos"
	autoLoad: true
Ext.define 'Siaco.store.Facturas',
	storeId: 'facturasStore'
	extend: 'Ext.data.Store'
	model: 'Siaco.model.Factura'
	proxy:
		type: "ajax"
		url: "facturas/catalogo"
		reader:
	  		type: "json"
	  		root: "datos"
	autoLoad: true
Ext.define 'Siaco.store.Arboles',
	proxy:
		type: 'ajax'
		method: 'GET'
		url: '/arboles'
	root:
		text: 'Menu'
		id: 'root_node'
		expanded: true
	folderSort: false
	sorters:
		property: 'id',
		direction: 'ASC'
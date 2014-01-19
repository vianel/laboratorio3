Ext.define 'Siaco.view.Arbol',
	extend: 'Ext.tree.Panel'
	store: Ext.create('Siaco.store.Arboles')
	xtype: 'vistaarbol'

	title: 'Menu'
	useArrows: true
	listeners:
		itemclick: (view, node) ->
			if !node.isLeaf()
				if node.isExpanded()
					node.collapse()
				else
					node.expand()
		
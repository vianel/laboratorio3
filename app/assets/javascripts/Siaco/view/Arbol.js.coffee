Ext.define 'Siaco.view.Arbol',
	extend: 'Ext.tree.Panel'
	store: Ext.create('Siaco.store.Arboles')
	xtype: 'arbolView'
	alias: 'widget.arbolView'

	title: 'Menu'
	useArrows: true
	listeners:
		itemclick: (view, node) ->
			if !node.isLeaf()
				if node.isExpanded()
					node.collapse()
				else
					node.expand()
				
			    

			 	

			else
				Ext.create('Ext.window.Window',
		    		items: [
		    			{
		    				xtype: node.raw.vinculo
		    			}
		    		]
		    		autoScroll: true
		    		maxHeight: 600
		    	).show()

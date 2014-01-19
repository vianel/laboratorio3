Ext.define 'Siaco.view.Inventario', 
    extend: 'Ext.form.Panel'
    alias: 'widget.inventarioview'
    title: 'Inventario'
    bodyPadding: 10

    items: [
        {
            xtype: 'textfield'
            fieldLabel: 'Código Inventario'
            name: 'codigoInventario'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Descripción Inventario'
            name: 'descripcionInventario'
        }
        {
            xtype: 'numberfield'
            fieldLabel: 'Cantidad'
            name: 'cantidadInventario'
        }
        {
            xtype: 'numberfield'
            fieldLabel: 'Stock Mínimo'
            name: 'stockMinInventario'
        }
        {
            xtype: 'numberfield'
            fieldLabel: 'Stock Máximo'
            name: 'stockMaxInventario'
        }
        {
            xtype: 'combobox',
            fieldLabel: 'Estatus',
            name: 'Estatus',
        #   store: Ext.create('KitchenSink.store.States'),
            emptyText: 'Seleccion Estatus...'
        }
    ]
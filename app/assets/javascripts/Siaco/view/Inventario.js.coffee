Ext.define 'Siaco.view.Inventario', 
    extend: 'Ext.form.Panel'
    xtype: 'inventarioView'
    title: 'Inventario'
    bodyPadding: 10

    initComponent: -> 
        @dockedItems = [{
            dock: 'bottom',
            buttons: [{
                text: 'Limpiar'
                iconCls:'limpiar'
                handler: ->
                    @up('form').getForm().reset()
                
                
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

    items: [
        {
            xtype: 'combobox'
            fieldLabel: 'Condominio'
            name: 'condominioInventario'
        }
        {
            xtype: 'combobox'
            fieldLabel: 'Producto'
            name: 'productoInventario'
        }
        {
            xtype: 'datefield'
            fieldLabel: 'Fecha Ingreso'
            name: 'fechaIngresoInventario'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Factura'
            name: 'facturaInventario'
        }
    ]
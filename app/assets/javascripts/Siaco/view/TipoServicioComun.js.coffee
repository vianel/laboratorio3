Ext.define 'Siaco.view.TipoServicioComun', 
    extend: 'Ext.form.Panel'
    xtype: 'tiposerviciocomunView'
    title: 'TipoServicioComun'
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
            name: 'condominioTipoServicioComun'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Nombre'
            name: 'nombreTipoServicioComun'
        }
        {
            xtype: 'textarea'
            fieldLabel: 'Descripción'
            name: 'descripcionTipoServicioComun'
        }
    ]
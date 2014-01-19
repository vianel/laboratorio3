Ext.define 'Siaco.view.Renovacion', 
    extend: 'Ext.form.Panel'
    xtype: 'renovacionView'
    title: 'Renovacion'
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
            fieldLabel: 'Licencia'
            name: 'licenciaRenovacion'
        }
        {
            xtype: 'datefield'
            fieldLabel: 'Fecha Renovación'
            name: 'fechaRenovacion'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Costo'
            name: 'costoRenovacion'
        }
    ]
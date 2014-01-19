Ext.define 'Siaco.view.Agenda', 
    extend: 'Ext.form.Panel'
    xtype: 'agendaView'
    title: 'Agenda'
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
            xtype: 'textarea'
            fieldLabel: 'Descripción'
            name: 'descripcionAgenda'
        }
        {
            xtype: 'datefield'
            fieldLabel: 'Fecha'
            name: 'fechaAgenda'
        }
        {
            xtype: 'timefield'
            fieldLabel: 'Hora'
            name: 'horaAgenda'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Lugar'
            name: 'lugarAgenda'
        }
    ]
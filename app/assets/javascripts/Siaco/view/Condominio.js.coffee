Ext.define 'Siaco.view.Condominio', 
    extend: 'Ext.form.Panel'
    xtype: 'condominioView'
    title: 'Condominio'
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
            xtype: 'textfield'
            fieldLabel: 'Rif Condominio'
            name: 'rifCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'nombre Condominio'
            name: 'nombreCondominio'
        }
        {
            xtype: 'textarea'
            fieldLabel: 'Direccion'
            name: 'direccionCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'telefono'
            name: 'telefonoCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Celular'
            name: 'celularCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Email'
            name: 'Email'
        }
    ]
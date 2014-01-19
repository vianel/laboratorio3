Ext.define 'Siaco.view.Licencia', 
    extend: 'Ext.form.Panel'
    xtype: 'licenciaView'
    title: 'Licencia'
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
            fieldLabel: 'Tipo licencia'
            name: 'tipolicencia'
        }
        {
            xtype: 'combobox'
            fieldLabel: 'Condominio'
            name: 'condominiolicencia'
        }
        {
            xtype: 'datefield'
            fieldLabel: 'Fecha de solicitud'
            name: 'fechasolicitudlicencia'
        }
        {
            xtype: 'datefield'
            fieldLabel: 'Fecha de activacion'
            name: 'fechaactivacionlicencia'
        }
        {
            xtype: 'checkbox'
            fieldLabel: 'Estado'
            name: 'estadolicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Tiempo de duracion'
            name: 'tiempoduracionlicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Costo'
            name: 'costolicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Cedula del contacto'
            name: 'cedulacontactolicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Nombre del contacto'
            name: 'nombrelicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Apellido del contacto'
            name: 'apellidolicencia'
        }
        {
            xtype: 'textarea'
            fieldLabel: 'direccion del contacto'
            name: 'direccionlicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'email del contacto'
            name: 'emaillicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'telefono del contacto'
            name: 'telefonolicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'celular del contacto'
            name: 'celularlicencia'
        }

    ]
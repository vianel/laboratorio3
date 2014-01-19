foto_1 = "images/usuario.jpeg"
ventanatiposerviciocomun = null
    


Ext.define 'Siaco.view.ServicioComun', 
    extend: 'Ext.form.Panel'
    xtype: 'serviciocomunView'
    title: 'ServicioComun'
    bodyPadding: 10
    height: 500

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
            fieldLabel: 'Tipo Servicio'
            name: 'tipoServicioComun'
        }
        {
            text: '...'
            xtype: 'button'
            id: 'paneltiposerviciocomun'
            iconCls: 'buscar'
            listeners: 
                click: ->
                    tiposerviciocomunView.show()
        }
        {
            xtype: 'datefield'
            fieldLabel: 'Fecha'
            name: 'fechaServicioComun'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Costo'
            name: 'costoServicioComun'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Foto Servicio'
            name: 'fotoServicioComun'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Imagen'
        }
        {
            xtype: 'textfield'
            id: 'imagen'
            emptyText: foto_1
            disabled: true
        }
        {
            xtype: 'image'
            id: 'imagen0'
            border: ''
            frame: true
            src: foto_1
        }
        {
            id: 'imagen1'
            border: ''
                 #atributo accept en algunos navegadores funciona 
                 #para firefox no accept="image/gif image/jpeg"
            html: '<input type="file" size="100" name="ufile[]" id="afile" onchange="previewImage(this)" />'
        }
    ]



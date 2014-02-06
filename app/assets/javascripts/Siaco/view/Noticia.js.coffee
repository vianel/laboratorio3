foto_1 = "images/usuario.jpeg"
Ext.define 'Siaco.view.Noticia', 
    extend: 'Ext.form.Panel'
    xtype: 'noticiaView'
    title: 'Noticia'
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
            fieldLabel: 'Asunto'
            name: 'AsuntoNoticia'
        }
        {
            xtype: 'textarea'
            fieldLabel: 'Descripcion Noticia'
            name: 'DescripcionNoticia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Foto'
            name: 'fotoNoticia'
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
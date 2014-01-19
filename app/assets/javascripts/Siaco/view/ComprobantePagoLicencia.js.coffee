foto_1 = "images/usuario.jpeg"

Ext.define 'Siaco.view.ComprobantePagoLicencia', 
    extend: 'Ext.form.Panel'
    xtype: 'comprobantepagolicenciaView'
    title: 'ComprobantePagoLicencia'
    bodyPadding: 10
    height: 640
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
            name: 'licenciaComprobacionPagoLicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Renovación'
            name: 'renovacionComprobacionPagoLicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Banco'
            name: 'bancoComprobacionPagoLicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'CI/RIF Depositante'
            name: 'cirifDepositanteComprobacionPagoLicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Nombre Depositante'
            name: 'nombreDepositanteComprobacionPagoLicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Nro Deposito'
            name: 'nroDepositoComprobacionPagoLicencia'
        }
        {
            xtype: 'datefield'
            fieldLabel: 'Fecha Deposito'
            name: 'fechaDepositoComprobacionPagoLicencia'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Foto Comprobante'
            name: 'fotoComprobacionPagoLicencia'
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
Ext.define 'Siaco.view.Condominio', 
    extend: 'Ext.form.Panel'
    xtype: 'condominioView'
    title: 'Condominio'
    id: 'condominioView'
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
                   guardarcondominio()

            
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
            fieldLabel: 'Codigo Condominio'
            name: 'codigoCondominio'
            id: 'codigoCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Rif Condominio'
            name: 'rifCondominio'
            id: 'rifCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'nombre Condominio'
            name: 'nombreCondominio'
            id: 'nombreCondominio'
        }
        {
            xtype: 'textarea'
            fieldLabel: 'Direccion'
            name: 'direccionCondominio'
            id: 'direccionCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'telefono'
            name: 'telefonoCondominio'
            id: 'telefonoCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Celular'
            name: 'celularCondominio'
            id: 'celularCondominio'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Email'
            name: 'Email'
            id: 'emailCondominio'
        }
    ]

guardarcondominio = ->
  Ext.Ajax.request
    url: "condominios/grabarcondominio"
    method: "GET"
    
    #Enviando los parametros a la pagina servidora
    params:
      ajax: "true"
      funcion: "grabarcondominio"
      codigocondominio: Ext.getCmp("codigoCondominio").getValue()
      rifcondominio: Ext.getCmp("rifCondominio").getValue() #obtiene el valor a traves del id del campo
      nombrecondominio: Ext.getCmp("nombreCondominio").getValue()
      direccioncondominio: Ext.getCmp("direccionCondominio").getValue()
      telefonocondominio: Ext.getCmp("telefonoCondominio").getValue()
      celularcondominio: Ext.getCmp("celularCondominio").getValue()
      emailcondominio: Ext.getCmp("emailCondominio").getValue()
    
    #Retorno exitoso de la pagina servidora a traves del formato JSON
    success: (resultado, request) ->
      datos = Ext.JSON.decode(resultado.responseText)
      Ext.Msg.alert "Exito", datos.msg
      Ext.getCmp("condominioView").getForm().reset()
      return

    
    #No hay retorno de la pagina servidora
    failure: ->
      Ext.Msg.alert "Error", "Servidor no conectado!"
      return

  return
Ext.define 'Siaco.view.Tiposancion', 
    extend: 'Ext.form.Panel'
    xtype: 'tiposancionView'
    id: 'tiposancionView'
    title: 'TipoSancion'
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
                if Ext.getCmp("idtiposancion").getValue().length is 0
                  guardartiposancion()
                else
                  modificartiposancion()
            
            },{
            text: 'Eliminar'
            iconCls:'eliminar'
            handler: ->
                eliminartiposancion()
            
            },{
            text: 'Buscar'
            iconCls:'buscar'
            handler: ->
                buscartiposancion()
            
            }]
        }]
        @callParent()

    items: [
        {
            xtype: 'textfield'
            fieldLabel: 'id'
            name: 'id'
            id: 'idtiposancion'
            #readOnly: true
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Nombre'
            name: 'nombre'
            id: 'nombretiposancion'
        }
        {
            xtype: 'textarea'
            fieldLabel: 'Descripcion'
            name: 'descripcion'
            id: 'descripciontiposancion'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Monto'
            name: 'monto'
            id: 'montotiposancion'
        }
        {
            xtype: 'textfield'
            fieldLabel: 'Penalizacion'
            name: 'penalizacion'
            id: 'penalizaciontiposancion'
        }
    ]


guardartiposancion = ->
  Ext.Ajax.request
    url: "tiposanciones/grabartiposancion"
    method: "GET"
    
    #Enviando los parametros a la pagina servidora
    params:
      ajax: "true"
      funcion: "grabartiposancion"
      nombre: Ext.getCmp("nombretiposancion").getValue() #obtiene el valor a traves del id del campo
      descripcion: Ext.getCmp("descripciontiposancion").getValue()
      monto: Ext.getCmp("montotiposancion").getValue()
      penalizacion: Ext.getCmp("penalizaciontiposancion").getValue()

    
    #Retorno exitoso de la pagina servidora a traves del formato JSON
    success: (resultado, request) ->
      datos = Ext.JSON.decode(resultado.responseText)
      Ext.Msg.alert "Exito", datos.msg
      Ext.getCmp("tiposancionView").getForm().reset()
      return

    
    #No hay retorno de la pagina servidora
    failure: ->
      Ext.Msg.alert "Error", "Servidor no conectado!"
      return

  return


 modificartiposancion = ->
  Ext.Ajax.request
    url: "tiposanciones/modificar"
    method: "GET"
    
    #Enviando los parametros a la pagina servidora
    params:
      ajax: "true"
      funcion: "modificar"
      id: Ext.getCmp("idtiposancion").getValue()
      nombre: Ext.getCmp("nombretiposancion").getValue() #obtiene el valor a traves del id del campo
      descripcion: Ext.getCmp("descripciontiposancion").getValue()
      monto: Ext.getCmp("montotiposancion").getValue()
      penalizacion: Ext.getCmp("penalizaciontiposancion").getValue()

    
    
    #Retorno exitoso de la pagina servidora a traves del formato JSON
    success: (resultado, request) ->
      datos = Ext.JSON.decode(resultado.responseText)
      Ext.Msg.alert "Exito", datos.msg
      Ext.getCmp("tiposancionView").getForm().reset()
      return

    
    #No hay retorno de la pagina servidora
    failure: ->
      Ext.Msg.alert "Error", "Servidor no conectado!"
      return

  return

buscartiposancion = ->
  Ext.Ajax.request
    url: "tiposanciones/buscarporid"
    method: "GET"
    
    #Enviando los parametros a la pagina servidora
    params:
      ajax: "true"
      funcion: "buscar"
      id: Ext.getCmp("idtiposancion").getValue()

    
    #Retorno exitoso de la pagina servidora a traves del formato JSON
    success: (resultado, request) ->
      datos = Ext.JSON.decode(resultado.responseText)
      if datos.exito is "true"
        Ext.getCmp("nombretiposancion").setValue datos.nombre
        Ext.getCmp("descripciontiposancion").setValue datos.descripcion
        Ext.getCmp("montotiposancion").setValue datos.monto
        Ext.getCmp("penalizaciontiposancion").setValue datos.penalizacion

      else
        Ext.Msg.alert "Error", datos.msg
      return

    
    #No hay retorno de la pagina servidora
    failure: ->
      Ext.Msg.alert "Error", "Servidor no conectado"
      return

  return


eliminartiposancion = ->
  loadingMask = new Ext.LoadMask(Ext.getBody(),
    msg: "eliminando..."
  )
  loadingMask.show()
  Ext.Ajax.request
    url: "tiposanciones/eliminar"
    method: "GET"
    
    #Enviando los parametros a la pagina servidora
    params:
      ajax: "true"
      funcion: "eliminar"
      id: Ext.getCmp("idtiposancion").getValue()

    
    #Retorno exitoso de la pagina servidora a traves del formato JSON
    success: (resultado, request) ->
      loadingMask.hide()
      datos = Ext.JSON.decode(resultado.responseText)
      Ext.Msg.alert "Mensaje", datos.msg
      Ext.getCmp("mipanelfacturas").getForm().reset()
      return

    
    #No hay retorno de la pagina servidora
    failure: (f, a) ->
      loadingMask.hide()
      Ext.Msg.alert "Error", "El servidor reporta:" + a.response.status + " " + a.response.statusText  if a.failureType is Ext.form.Action.CONNECT_FAILURE
      Ext.Msg.alert "Advertencia", a.result.errormsg  if a.failureType is Ext.form.Action.SERVER_INVALID
      return

  return
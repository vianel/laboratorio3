arregloroles = [
  "Propietario"
  "Administrador"
  "Empleado"
  "Junta"
]
Ext.define 'Siaco.view.Usuario', 
    extend: 'Ext.form.Panel'
    xtype: 'usuarioView'
    id: 'usuarioView'
    title: 'Nuevo Usuario'
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
                  guardarnuevousuario()
                
                 #modificarnuevousuario()
            
            },{
            text: 'Eliminar'
            iconCls:'eliminar'
            handler: ->
                eliminarnuevousuario()
            
            },{
            text: 'Buscar'
            iconCls:'buscar'
            handler: ->
                buscarnuevousuario()
            
            }]
        }]
        @callParent()

    items: [
        {
          fieldLabel: 'Usuario'
          xtype: 'textfield'
          name: 'usuario'
          id: 'usuariousuario'
          allowBlank: false
        }
        {
          fieldLabel: 'Clave'
          xtype: 'textfield'
          name: 'clave'
          id: 'passwordusuario'
          inputType: 'password'
          allowBlank: false
        }
        {
          xtype: 'combobox'
          fieldLabel: 'Rol'
          store: arregloroles
          id: 'rol'
        }
    ]


guardarnuevousuario = ->
  Ext.Ajax.request
    url: "usuarios/grabarusuario"
    method: "GET"
    
    #Enviando los parametros a la pagina servidora
    params:
      ajax: "true"
      funcion: "grabarusuario"
      login: Ext.getCmp("usuariousuario").getValue() #obtiene el valor a traves del id del campo
      password: Ext.getCmp("passwordusuario").getValue()
      rol: Ext.getCmp("rol").getValue()

    
    #Retorno exitoso de la pagina servidora a traves del formato JSON
    success: (resultado, request) ->
      datos = Ext.JSON.decode(resultado.responseText)
      Ext.Msg.alert "Exito", datos.msg
      Ext.getCmp("usuarioView").getForm().reset()
      return

    
    #No hay retorno de la pagina servidora
    failure: ->
      Ext.Msg.alert "Error", "Servidor no conectado!"
      return

  return


 modificarnuevousuario = ->
  Ext.Ajax.request
    url: "usuarios/modificar"
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

buscarnuevousuario = ->
  Ext.Ajax.request
    url: "usuarios/buscarporid"
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


eliminarnuevousuario = ->
  loadingMask = new Ext.LoadMask(Ext.getBody(),
    msg: "eliminando..."
  )
  loadingMask.show()
  Ext.Ajax.request
    url: "usuarios/eliminar"
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
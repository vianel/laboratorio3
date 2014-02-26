var arregloroles, buscarnuevousuario, eliminarnuevousuario, guardarnuevousuario, modificarnuevousuario, mostrarpanelempleados, mostrarpanelpropietarios;

arregloroles = ["Propietario", "Empleado"];
Ext.onReady(function() {
  
  Ext.QuickTips.init();
Ext.define('Siaco.view.Usuario', {
  extend: 'Ext.form.Panel',
  xtype: 'usuarioView',
  id: 'usuarioView',
  title: 'Nuevo Usuario',
  bodyPadding: 10,
  initComponent: function() {
    this.dockedItems = [
      {
        dock: 'bottom',
        buttons: [
          {
            text: 'Limpiar',
            iconCls: 'limpiar',
            handler: function() {

            return this.up('form').getForm().reset();
            }
          }, {
            text: 'Grabar',
            iconCls: 'grabar',
            handler: function() {
              return guardarnuevousuario();
            }
          }, {
            text: 'Eliminar',
            iconCls: 'eliminar',
            handler: function() {
              return eliminarnuevousuario();
            }
          }, {
            text: 'Buscar',
            iconCls: 'buscar',
            handler: function() {
              return buscarnuevousuario();
            }
          }
        ]
      }
    ];
    this.callParent();
  },
  items: [
    {
      fieldLabel: 'Usuario',
      xtype: 'textfield',
      name: 'usuario',
      id: 'usuariousuario',
      allowBlank: false
    }, {
      fieldLabel: 'Clave',
      xtype: 'textfield',
      name: 'clave',
      id: 'passwordusuario',
      inputType: 'password',
      allowBlank: false
    }, {
      xtype: 'combobox',
      fieldLabel: 'Rol',
      store: arregloroles,
      id: 'rol'
    }
  ]
});

}); //fin on ready
guardarnuevousuario = function() {
  Ext.Ajax.request({
    url: "usuarios/grabarusuario",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "grabarusuario",
      login: Ext.getCmp("usuariousuario").getValue(),
      password: Ext.getCmp("passwordusuario").getValue(),
      rol: Ext.getCmp("rol").getValue()
    },
    success: function(resultado, request) {
      var datos;
      datos = Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert("Exito", datos.msg);
      if (datos.msg != "Ese usuario ya existe")
      {
        if (Ext.getCmp("rol").getValue() === "Empleado") {
            mostrarpanelempleados();
          } else {
            mostrarpanelpropietarios();
          }
      }
      return Ext.getCmp("usuarioView").getForm().reset();
    },
    failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado!");
    }
  });
};

modificarnuevousuario = function() {
  Ext.Ajax.request({
    url: "usuarios/modificar",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "modificar"
    },
    success: function(resultado, request) {
      var datos;
      datos = Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert("Exito", datos.msg);
      Ext.getCmp("tiposancionView").getForm().reset();
    },
    failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado!");
    }
  });
};

buscarnuevousuario = function() {
  Ext.Ajax.request({
    url: "usuarios/buscarporid",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "buscar",
      id: Ext.getCmp("idtiposancion").getValue()
    },
    success: function(resultado, request) {
      var datos;
      datos = Ext.JSON.decode(resultado.responseText);
      if (datos.exito === "true") {

      } else {
        Ext.Msg.alert("Error", datos.msg);
      }
    },
    failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado");
    }
  });
};

eliminarnuevousuario = function() {
  var loadingMask;
  loadingMask = new Ext.LoadMask(Ext.getBody(), {
    msg: "eliminando..."
  });
  loadingMask.show();
  Ext.Ajax.request({
    url: "usuarios/eliminar",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "eliminar",
      id: Ext.getCmp("idtiposancion").getValue()
    },
    success: function(resultado, request) {
      var datos;
      loadingMask.hide();
      datos = Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert("Mensaje", datos.msg);
      Ext.getCmp("mipanelfacturas").getForm().reset();
    },
    failure: function(f, a) {
      loadingMask.hide();
      if (a.failureType === Ext.form.Action.CONNECT_FAILURE) {
        Ext.Msg.alert("Error", "El servidor reporta:" + a.response.status + " " + a.response.statusText);
      }
      if (a.failureType === Ext.form.Action.SERVER_INVALID) {
        Ext.Msg.alert("Advertencia", a.result.errormsg);
      }
    }
  });
};

mostrarpanelpropietarios = function() {
  Ext.create("Ext.window.Window", {
    items: [
      {
        xtype: "actualizarpropietarioview"
      }
    ],
    autoScroll: true,
    maxHeight: 600
  }).show();
};

function mostrarpanelempleados() {
  return Ext.create("Ext.window.Window", {
    items: [
      {
        xtype: "empleadosview"
      }
    ],
    autoScroll: true,
    maxHeight: 600
  }).show();
};

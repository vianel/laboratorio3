Ext.onReady(function() {
  
  Ext.QuickTips.init();
  Ext.define('Siaco.view.MiPaneltipopublicaion', {
    extend: 'Ext.form.Panel',
    
    initComponent : function() {
      this.dockedItems = [{
        dock: 'bottom',
        buttons: [{
          text: 'Limpiar',
          iconCls:'limpiar',
          handler: function() {
            Ext.getCmp('tipopublicacion').getForm().reset();
          }
          
        },{
        text: 'Grabar',
        iconCls:'grabar',
        handler:function() {
          guardartipopublicacion();
        }
        },{
        text: 'Eliminar',
        iconCls:'eliminar',
        handler:function() {
          Ext.Msg.alert('Pronto','En construccion');
        }
        }]
      }];
      this.callParent();
    }
  });

Ext.define('Siaco.view.Tipopublicacion', {
    extend: 'Siaco.view.MiPaneltipopublicaion',
    xtype: 'tipopublicacionView',
    alias: 'widget.tipopublicacion',
    id: 'tipopublicacion',
    title: 'Nuevotipopublicacion',
    bodyPadding: 5,
    width: 450,
    
    initComponent: function () {
      
      this.items = [
      {
        fieldLabel: 'Nombre',
        xtype: 'textfield',
        name: 'nombre',
        id: 'nombretipopublicacion'
      },{
        fieldLabel: 'Codigo',
        xtype: 'textfield',
        name: 'codigo',
        id: 'codigotipopublicacion'
      },{
        fieldLabel: 'Descripcion',
        xtype: 'textarea',
        name: 'descripcion',
        id: 'descripciontipopublicacion'
      }
      ];
      this.callParent();
      Ext.getCmp('nombretipopublicacion').focus();
    }
  });
});

   function guardartipopublicacion()
   {
      Ext.Ajax.request({
       url: 'tipopublicaciones/grabar',
     method: 'GET',
       //Enviando los parametros a la pagina servidora
       params: {
        ajax: 'true',
        funcion: 'grabar',

        nombre: Ext.getCmp('nombretipopublicacion').getValue(), //obtiene el valor a traves del id del campo
        codigo: Ext.getCmp('codigotipopublicacion').getValue(),
        descripcion: Ext.getCmp('descripciontipopublicacion').getValue(),
       
       },
       //Retorno exitoso de la pagina servidora a traves del formato JSON
       success: function( resultado, request ) {
        datos=Ext.JSON.decode(resultado.responseText);
        Ext.Msg.alert('Exito', datos.msg);
        Ext.getCmp('tipopublicacion').getForm().reset();
       },
       //No hay retorno de la pagina servidora
       failure: function() {
        Ext.Msg.alert("Error", "Servidor no conectado!");
       }
      });
   }
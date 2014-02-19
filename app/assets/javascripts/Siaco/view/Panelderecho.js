Ext.onReady (function (){
Ext.QuickTips.init();
Ext.define('Siaco.view.Panelderecho', {
    extend: 'Ext.container.Container',
    xtype: 'panelderechoView',
    id: 'panelderechoView',
    alias: 'widget.panelderechoView',
   // x:-200 , y:-130,
  //	height:380,
  
    
    //width: 550,
    layout: {
        type: 'fit'
    },

    initComponent: function() {
        var me = this;
        buscarcondominio();
        Ext.applyIf(me, {
            items: [
                  {
                    xtype: 'panel',
                    layout: 'fit',
                    bodyPadding: 10,
                    title: 'Informacion',
                    items: [
                        {
                            xtype: 'label',
                            height: 110,
                            width: 300,
                            text: 'Condominio: '
                    
                        },{
                            xtype: 'label',
                            height: 110,
                            width: 300,
                            id: 'condominio'
                    
                        },                        {
                            xtype: 'label',
                            height: 110,
                            width: 300,
                            text: 'Inmueble: '
                    
                        },{
                            xtype: 'label',
                            height: 110,
                            width: 300,
                            id: 'inmueble'
                    
                        }
                    ]
                }
            ]
        });
        me.callParent(arguments);
    }

});

   });//fin del on ready

function buscarcondominio()
{
     Ext.Ajax.request({
 url: 'sesiones/buscarcondominio',
 method: 'GET',
 //Enviando los parametros a la pagina servidora
 params: {
  ajax: 'true',
  funcion: 'buscarcondominio',
  //id: Ext.getCmp('id').getValue()
 },
 //Retorno exitoso de la pagina servidora a traves del formato JSON
 success: function( resultado, request ) {
  datos=Ext.JSON.decode(resultado.responseText);
  if (datos.exito=='true') {
   Ext.getCmp('condominio').setText(datos.nombre);
   Ext.getCmp('inmueble').setText(datos.inmueble);

  }
  else {
   Ext.Msg.alert("Error", datos.msg);
  }
 },
 //No hay retorno de la pagina servidora
 failure: function() {
  Ext.Msg.alert("Error", "Servidor no conectado");
 }
});  
}
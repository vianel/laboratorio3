Ext.onReady (function (){
Ext.QuickTips.init();
Ext.define('Siaco.view.Panelderecho', {
    extend: 'Ext.container.Container',
    xtype: 'panelderechoView',
    id: 'panelderechoView',
    alias: 'widget.panelderechoView',
  
    
    width: 250,
    layout: {
        type: 'absolute'
    },

    initComponent: function() {
        var me = this;
        buscarcondominio();
       // buscarnoticias();
        Ext.applyIf(me, {

            items: [
              {
                    xtype: 'tabpanel',
                    activeTab: 0,
                    items: [
                        {
                          title: 'Infomacion',
                          xtype: 'mipanelprincipalcartelera'
                        }
                   ]
                }



            ]
        });
        me.callParent(arguments);
    }

});

   });//fin del on ready

function buscarnoticias()
{
     Ext.Ajax.request({
 url: 'sesiones/buscarpublicacionesencartelera',
 method: 'GET',
 //Enviando los parametros a la pagina servidora
 params: {
  ajax: 'true',
  funcion: 'buscarpublicacionesencartelera',
  //id: Ext.getCmp('id').getValue()
 },
 //Retorno exitoso de la pagina servidora a traves del formato JSON
 success: function( resultado, request ) {
  datos=Ext.JSON.decode(resultado.responseText);
  if (datos.exito=='true') {
   Ext.getCmp('titulo').setText(datos.titulo);
   Ext.getCmp('descripcion').setText(datos.descripcion);
   Ext.getCmp('fecha').setText(datos.fecha);

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
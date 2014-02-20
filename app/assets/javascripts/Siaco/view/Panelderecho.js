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
        buscarnoticias();
        Ext.applyIf(me, {

            items: [
              {
                    xtype: 'tabpanel',
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            layout: 'absolute',
                            title: 'Informacion',
                            items: [  
                
                        {
                            xtype: 'label',
                            text: 'Condominio: \r\n',
                            y: 10,
                            x:20         
                        },{
                            xtype: 'label',
                            id: 'condominio',
                            y: 10,
                            x:97
                    
                        },{
                            xtype: 'label',
                            text: 'Inmueble: ',
                            y: 40,
                            x:20
                    
                        },{
                            xtype: 'label',
                            id: 'inmueble',
                            y: 40,
                            x:80
                        },{
                            xtype: 'label',
                            text: 'Bienvenido: ',
                            y: 70,
                            x:20
                    
                        },{
                            xtype: 'label',
                            id: 'usuario',
                            y: 70,
                            x:95
                        }
                             ]
              },{
                        xtype: 'panel',
                            layout: 'fit',
                            title: 'Noticias',
                            items: [
                          {
                            xtype: 'label',
                            id: 'titulo',
                          //  y: 10,
                           // x:97
                    
                        },{
                            xtype: 'label',
                            id: 'descripcion',
                          //  y: 10,
                          //  x:97
                    
                        },{
                            xtype: 'label',
                            id: 'fecha',
                          //  y: 10,
                          //  x:97
                    
                        }
                                  ]
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
   Ext.getCmp('usuario').setText(datos.nomprepropietario);
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
//Definicion de la clase MiPanelJunta_Condominio
   Ext.define('Siaco.view.MiPanelPrincipalCartelera', {
    extend: 'Ext.form.Panel',
    
    initComponent : function() {
      this.dockedItems = [ {} ];
     //Llamamos a la super clase a iniciacion del componente
   this.callParent(); 
 }
    
   });


   var dateMenu = Ext.create('Ext.menu.DatePicker', {
    handler: function(dp, date){
        Ext.Msg.alert('Date Selected', 'You selected ' + Ext.Date.format(date, 'M j, Y'));
        Ext.getCmp('mitabpanel_reservacion').show();
    }
  });



   Ext.define('Siaco.view.MiPanelPrincipalCarteleraPestana1', {
    extend: 'Siaco.view.MiPanelPrincipalCartelera',

    //Definicion del alias que puede usado en un xtype
    alias: 'widget.mipanelprincipalcartelera',
    id: 'mipanelprincipalcartelera',
    layout: 'absolute',
    xtype: 'mipanelprincipalcartelera',
    bodyPadding: 5,
    width: 450,

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion del panel
        this.items = [
        {
                        xtype:'label',
                        text:'Bienvenido a su Condominio:',
                        id:'titulobienvenido',
                        x:10,
                        y:5,
                     },{
                        xtype:'label',
                        id:'condominio',
                        style: {color:'#00C24E'},
                        x:10,
                        y:25,
                     },{
                        xtype:'label',
                        text:'Usuario',
                        id:'tituloaldiadehoy',
                        x:10,
                        y:40,
                     },{
                        xtype:'label',
                        id:'usuario',
                        style: {color:'#00C24E'},
                        x:62,
                        y:40,
                     },{
                        xtype:'label',
                        text:'Inmueble',
                        x:10,
                        y:60,
                     },{
                        xtype:'label',
                        id:'inmueble',
                        style: {color:'#00C24E'},
                        x:68,
                        y:60,
                     },/*{
                        text: 'Ver Estadisticas',
                        xtype: 'button',
                        x:10,
                        y:40,
                        id: 'carteleraestadisticas'
                     },{
                        text: 'Salir',
                        xtype: 'button',
                        x:10,
                        y:70,
                        id: 'salirasdfasd'
                     },*/{
                        fieldLabel: '...',
                        name: 'divisor1cartelera',
                        id:'divisor1cartelera',
                        y:100,
                        allowBlank: false

                     },{
                        xtype:'label',
                        text:'Últimas Noticias',
                        id:'tituloultimanoticia',
                        x:40,
                        y:110,
                     },{
                        xtype:'label',
                        text:'______________',
                        style: {color:'#00C24E'},
                        id:'lbl1',
                        x:37,
                        y:110,
                     },{
                        xtype: 'container',
                        height:75,
                        width:323,
                        layout:'absolute',
                        x:10,
                        y:130,
                        border: 1,
                        style: {borderColor:'#0099FF', borderStyle:'solid', borderWidth:'2px'},
                        items:[
                        {
                              xtype:'label',
                              text:'Encabezado de Noticia 1',
                              style: {color:'#00C24E',size:'14px'},
                              id:'tituloencabezado',
                              x:5,
                              y:5,
                              /*autoEl: {
                                  tag: 'a',
                                  href: 'http://www.example.com/',
                                  html: 'Example.com'
                              }*/
                           },{
                              xtype:'label',
                              text:'Aquí se encontrara la descripción de la primera noticia a ser mostrada',
                              id:'titulodescripcionnoticia',
                              x:5,
                              y:25,
                              height:30,
                           }
                        ]  
                      },{
                        xtype: 'container',
                        height:75,
                        width:323,
                        layout:'absolute',
                        x:10,
                        y:208,
                        border: 1,
                        style: {borderColor:'#0099FF', borderStyle:'solid', borderWidth:'2px'},
                        items:[
                        {
                              xtype:'label',
                              text:'Encabezado de Noticia 2',
                              style: {color:'#00C24E',size:'14px'},
                              id:'tituloencabezado2',
                              x:5,
                              y:5,
                              /*autoEl: {
                                  tag: 'a',
                                  href: 'http://www.example.com/',
                                  html: 'Example.com'
                              }*/
                           },{
                              xtype:'label',
                              text:'Aquí se encontrara la descripción de la segunda noticia a ser mostrada',
                              id:'titulodescripcionnoticia2',
                              x:5,
                              y:25,
                              height:30,
                           }
                        ]  
                      },{
                        text: 'Sig Noticias >',
                        xtype: 'button',
                        x:259,
                        y:285,
                        id: 'siguientenoticia'
                     },{
                        text: 'Ver Noticias',
                        xtype: 'button',
                        x:182,
                        y:285,
                        id: 'vernoticias',
                        handler: function() {
                           ventana = Ext.create('miVentanaInformeNoticia');
                           ventana.show();
                       }
                     }
      ];

      this.callParent();
    }
   });


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
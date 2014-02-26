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
                        id:'usuariologueado',
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
                        id:'inmueblelogueado',
                        style: {color:'#00C24E'},
                        x:68,
                        y:60,
                     },{
                        xtype:'label',
                        text:'Estatus: ',
                        x:18,
                        y:80,
                     },{
                        xtype:'label',
                        id:'solvencia',
                        style: {color:'#00C24E'},
                        x:68,
                        y:80,
                     },{
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
                              style: {color:'#00C24E',size:'14px'},
                              id:'titlodelaultimanoticia',
                              x:5,
                              y:5,
                              /*autoEl: {
                                  tag: 'a',
                                  href: 'http://www.example.com/',
                                  html: 'Example.com'
                              }*/
                           },{
                              xtype:'label',
                              id:'descripcionnoticia',
                              x:5,
                              y:25,
                              height:30,
                           }/*,{
                              xtype:'label',
                              style: {color:'#000000',size:'01px'},
                              id:'fecha',
                              x:75,
                              y:48,
                              height:2,
                           }*/
                        ]  
                      },{
                        text: 'Ver Noticias',
                        xtype: 'button',
                        x:182,
                        y:285,
                        id: 'vernoticias',
                        handler: function() {
                           vernoticias();
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
   Ext.getCmp('usuariologueado').setText(datos.nomprepropietario);
  if (datos.solvencia == 'true')
  {
    Ext.getCmp('solvencia').setText('Solvente');
  }else
  {
    Ext.getCmp('solvencia').setText('Moroso');
  }
   
   Ext.getCmp('inmueblelogueado').setText(datos.inmueble);

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
   Ext.getCmp('titlodelaultimanoticia').setText(datos.titulo);
   Ext.getCmp('descripcionnoticia').setText(datos.descripcion);
 
  }
 },
 //No hay retorno de la pagina servidora
 failure: function() {
   Ext.getCmp('titlodelaultimanoticia').setText('Vacio');
   Ext.getCmp('descripcionnoticia').setText('No ha recibido ninguna noticia');

 }
});  
}
function vernoticias(){
   //Instanciamos la ventana
    Ext.create('Ext.window.Window',{
            items: [
              {
                xtype: 'timelimeView'
              }
            ],
            autoScroll: true,
            maxHeight: 600
          }).show()
}
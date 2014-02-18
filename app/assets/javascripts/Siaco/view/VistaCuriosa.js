Ext.onReady (function (){
Ext.QuickTips.init();
Ext.define('Siaco.view.VistaCuriosa', {
	id: 'VistaCuriosas',
    extend: 'Ext.container.Container',
    xtype: 'vistacuriosaview',
   // x:-290 , y:-190,
  	height:480,
    width: 900,
    layout: {
        type: 'absolute'
    },

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
             
                
                 {
                    xtype: 'label',
                    x: 620,
                    y: 70,
                    height: 20,
                    width: 380,
                    id: 'text5',
                    text: 'Para saber como adquirlo, enviamos tu correo y te haremos llegar la información:'
                },
                
                {
                    xtype: 'button',
                    x: 620,
                    y: 210,
                    width: 260,
                    icon:'images/iconos/download.png',
                    text: 'DESCARGAR VERSIÓN DE PRUEBA'
                },
                {
                    xtype: 'button',
                    x: 620,
                    y: 240,
                    width: 260,
                    icon:'images/iconos/comprar1.png',
                    text: 'COMPRAR'
                },
            
                {
                    xtype: 'textfield',
                    x: 619,
                    y: 100,
                    fieldLabel: 'Correo Electrónico:'
                },
                {
                    xtype: 'button',
                    x: 1510,
                    y: 105,
                    width: 90,
                    icon:'images/iconos/mail.png',
                    text: 'Enviar'
                },
                {
                    xtype: 'label',
           			autoEl: {tag: 'a', href: '/sesiones', html: 'Ya tienes tu Licencia'},
                    x: 680,
                    y: 170,
                    width:200,
                
                }, {
                    xtype: 'image',
                    x: 955,
                    y: 270,
                    src: 'images/movil1.png',
                    height: 100,
                    width: 150
                },
                {
                    xtype: 'label',
                    x: 640,
                    y: 380,
                    height: 50,
                    width: 260,
                    id:'propaganda',
                    text: 'Disponible tambien para Android y IOS '
                }, {
                    xtype: 'image',
                    x:190,
                    y: 30,
                    src: 'images/linea1.png',
                    height: 470,
                    width: 10
                }, 
                {
                    xtype: 'image',
                    x: 830,
                    y: 30,
                    src: 'images/linea1.png',
                    height: 470,
                    width: 10
                },
                {
                    xtype: 'image',
                    x: 115,
                    y: 410,
                    src: 'images/twitter.png',
                    height: 40,
                    width: 60
                },
                
                 {
                    xtype: 'image',
                    x: 55,
                    y: 405,
                    src: 'images/facebook.png',
                    height: 45,
                    width: 50
                },
                
                
                
              {
                    xtype: 'tabpanel',
                //    x: 215,
                  //  y: 30,
                    height: 430,
                    width: 605,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 444,
                            layout: 'absolute',
                            title: 'Caracteristicas',
                            items: [  
                
					                {
					                    xtype: 'image',
					                    x: 230,
					                    y: 120,
					                    height: 190,
					                    src: 'images/centro.png',
					                    width: 150
					                },
					                {
					                    xtype: 'image',
					                    x: 20,
					                    y: 50,
					                    height: 40,
					                    src: 'images/portable.png',
					                    width: 50
					                },
					                {
					                    xtype: 'image',
					                    x: 390,
					                    y: 60,
					                    height: 40,
					                   src: 'images/facilmanejo.png',
					                    width: 50
					                },
					                {
					                    xtype: 'image',
					                    x: 20,
					                    y: 240,
					                    height: 40,
					                      src: 'images/seguridad.png',
					                    width: 50
					                },
					                {
					                    xtype: 'image',
					                     x: 390,
					                    y: 240,
					                    height: 40,
					                    src: 'images/multiusuario.png',
					                    width: 50
					                },
					                {
					                    xtype: 'label',
					                    x: 70,
					                    y: 60,
					                    height: 30,
					                    width: 110,
					                    id: 'PORTABILIDAD',
					                    text: 'PORTABILIDAD'
					                },
					                {
					                    xtype: 'label',
					                    x: 450,
					                    y: 70,
					                    height: 30,
					                    width: 110,
					                     id: 'FACILMANEJO',
					                    text: 'FACIL MANEJO'
					                },
					                {
					                    xtype: 'label',
					                    x: 450,
					                    y: 250,
					                    height: 30,
					                    width: 110,
					                     id: 'MULTIUSUARIO',
					                    text: 'MULTI USUARIO'
					                },
					                {
					                    xtype: 'label',
					                    x: 70,
					                    y: 250,
					                    height: 30,
					                    width: 150,
					                     id: 'SEGRUIDAD',
					                    text: 'SEGURIDAD DE DATOS'
					                },
					                {
					                    xtype: 'label',
					                    x: 20,
					                    y: 90,
					                    height: 50,
					                    width: 190,
					                    id: 'text1',
					                    text: 'Puedes acceder a tu información cuando y donde lo necesites. Solo te conectas a internet y ¡LISTO!'
					                },
					               
					                {
					                    xtype: 'label',
					                    x: 20,
					                    y: 280,
					                    height: 50,
					                    width: 190,
					                    id: 'text2',
					                    text: 'Este sistema de administración de condominio efectua el respaldo programado de todos sus datos importantes, en la nube, garantizandole la seguridad de la información.'
					                },
					                {
					                    xtype: 'label',
					                    x: 390,
					                    y: 100,
					                    height: 50,
					                    width: 190,                    
					                    id: 'text3',
					                    text: 'Desarrollado para llevar de una manera fácil la Gestión de gastos y cobranzas de condominios.Gráfico, amigable e intuitivo y sin necesidad de instalación'
					                },
					                {
					                    xtype: 'label',
					                    x: 390,
					                    y: 290,
					                    height: 50,
					                    width: 190,
					                    id: 'text4',
					                    text: 'Varios usuarios pueden estar conectados trabajando en un mismo momento. Puede llevar la administración de varios inmuebles.'
					                }
					                   ]
					                        },
					                {
					                            xtype: 'panel',
					                            height: 444,
					                            width: 910,
					                            layout: 'absolute',
					                            title: '¿Que puedes hacer?',
					                            items: [
					                                {
					                                    xtype: 'label',
					                                    x: 30,
					                                    y: 60,
					                                    height: 30,
					                                    width: 610,
					                                    id:'puedes',
					                                    text: 'DESDE LA APLICACIÓN PUEDES:'
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 100,
					                                    height: 20,
					                                    width: 200,
					                                    text: '*Realizar tus Pagos en Linea, '
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 310,
					                                    height: 10,
					                                    width: 390,
					                                    text: '*Administrar el Condominio tu Celular'
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 130,
					                                    height: 10,
					                                    width: 250,
					                                    text: '*Manejar el Inventario de tu Condominio.'
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 160,
					                                    height: 50,
					                                    width: 250,
					                                    text: '*Revisar la Cartelera Virtual'
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 190,
					                                    height: 50,
					                                    width: 390,
					                                    text: '*Enviar Notificaciones Personalizadas a los diferentes usuarios. '
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 220,
					                                    height: 50,
					                                    width: 390,
					                                    text: '*Reservar las Areas Comunes para los eventos. '
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 250,
					                                    height: 50,
					                                    width: 390,
					                                    text: '*Impresion de Facturas, Estados de Cuenta, entre otros. '
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 100,
					                                    y: 280,
					                                    height: 20,
					                                    width: 450,
					                                    text: '*Consultar si un propietario está solvente y  pagos realizados anteriormente'
					                                },
					                                {
					                                    xtype: 'label',
					                                    x: 320,
					                                    y: 350,
					                                    height: 20,
					                                    width: 390,
					                                    id:'muchomas',
					                                    text: 'Y mucho más...'
					                                },
					                                {
					                                    xtype: 'image',
					                                    x: 400,
					                                    y: 10,
					                                    height: 150,
					                                    src: 'images/calcu.png',
					                                    width: 90
					                                     
					                                }
					                            ]
					                        },{
		//AQUI ESTA LA PESATAÑA DONDE ESTA EL FORMULARIO DE LOGIN
					                     		xtype: 'panel',
					                            height: 444,
					                            width: 910,
					                            layout: 'absolute',
					                            title: 'Loguearse',
					                            items: [
					                                {
					                                	x:120,
					                                	y:150,
					                                    xtype: 'loginView'
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
/*var acum;     	
    	acum = Ext.create ('Siaco.view.VistaCuriosa')
    	acum.show ();*/
   });
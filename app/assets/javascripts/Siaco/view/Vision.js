Ext.onReady (function (){
Ext.QuickTips.init();
Ext.define('Siaco.view.Vision', {
    extend: 'Ext.container.Container',
    xtype: 'visionView',
    id: 'visionView',
    alias: 'widget.visionView',
   // x:-200 , y:-130,
  	height:380,
  	
    //width: 550,


    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
            {
            	xtype: 'image',
                //    x: 20,
               //     y: 10,
                    src: 'images/linea1.png',
                    height: 470,
                    width: 10
                }, 
                {
                    xtype: 'image',
               //     x: 870,
               //     y: 10,
                    src: 'images/linea1.png',
                    height: 470,
                    width: 10
                },
                  {
                    xtype: 'container',
                  //  x: 60,
                   // y: 20,
                   // height: 330,
                    //width: 760,
           //         layout: 'fit',
                    bodyPadding: 10,
                    title: 'VISION',
                    items: [
                        {
                            xtype: 'label',
                           // x: 50,
                          //  y: 10,
                            text: 'NUESTRA VISIÓN'
                        },
                        {
                            xtype: 'label',
                 //           x: 80,
                 //           y: 100,
                            height: 110,
                            width: 410,
                            text: '*Tomar en cuenta a nuestros clientes integrándolos en un equipo multidisciplinario en donde participen activamente en la planeación de los proyectos y logros del condominio y con ello convertir a SIACO no solo en una empresa de administración, sino en un aliado de los condóminos, que les permita disfrutar al máximo su lugar de residencia e incrementando la plusvalía de su patrimonio. '
                        },
                        {
                            xtype: 'label',
                 //           x: 80,
                 //           y: 230,
                            height: 110,
                            width: 410,
                            text: '*Prestar un servicio personalizado de calidad en el área de venta de inmuebles.'
                        },
                        {
                            xtype: 'image',
                            x: 520,
                            y: 20,
                            src: 'images/vision.png',
                            height: 270,
                            width: 220
                        }
                    ]
                }
            ]
        });
        me.callParent(arguments);
    }

});

   });
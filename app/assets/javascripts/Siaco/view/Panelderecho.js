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
                            text: 'Villa roca'
                    
                        }
                    ]
                }
            ]
        });
        me.callParent(arguments);
    }

});

   });
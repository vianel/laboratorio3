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


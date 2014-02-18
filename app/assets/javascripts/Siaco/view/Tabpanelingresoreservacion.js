Ext.onReady (function (){
Ext.QuickTips.init();
Ext.define('Siaco.view.Tabpanelingresoreservacion', {
	id: 'tabpanelingresoreservacion',
  //  extend: 'Ext.container.Container',
    extend: 'Ext.form.Panel',
    xtype: 'tabpanelingresoreservacionview',
  layout: {
        type: 'fit'
    },

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                
              {
                    xtype: 'tabpanel',
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            layout: 'fit',
                            title: 'Ingresos',
                            items: [  
                
					                {
					                    xtype: 'ingresoview',
                                        

					                }
					                   ]
					    },{
                     		xtype: 'panel',
                            layout: 'fit',
                            title: 'Reservar',
                            items: [
                                {

                                    xtype: 'reservacionview',
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
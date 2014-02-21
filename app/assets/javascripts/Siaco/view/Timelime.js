Ext.define('Siaco.view.Timelime', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.timelimeView',
    xtype: 'timelimeView',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "id", flex: 1  },
            {text: "nombre", flex: 1},
            {text: "apellido", width: 100},
            {text: "cedula", flex: 1 },
            
        ];

  

        this.callParent();
    }
});
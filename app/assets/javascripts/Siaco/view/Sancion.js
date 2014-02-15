var tabs = null;
var ventana = null;
var edosolvenciastore = ['Solvente','Moroso'];
Ext.onReady(function() {
	
	Ext.QuickTips.init();

//MODELO
Ext.define('Inmueble', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'inmuebles/buscar'
           }
});


//Definicion del Data Store
var InmuebleStore = Ext.create('Ext.data.Store', {
    model: 'Inmueble',
    autoLoad: true,
});
Ext.define('tiposancion', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'nombre', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'tiposanciones/buscar'
           }
});

//Definicion del Data Store
var tiposancionStore = Ext.create('Ext.data.Store', {
    model: 'tiposancion',
    autoLoad: true,
});


		Ext.define('App.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelsanciones').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
			
							  guardarsancion();

				}
				},{
				text: 'Eliminar',
				iconCls:'eliminar',
				handler:function() {
					Ext.Msg.alert('Pronto','En construccion');
				}
				}]
			}];
			this.callParent();
		}
	});
Ext.define('Siaco.view.Sancion', {
		extend: 'App.MiPanel',
		xtype: 'sancionview',
		alias: 'widget.mipanelsanciones',
		id: 'mipanelsanciones',
		title: 'Sancionar',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				xtype:'combobox',
                id : 'inmueble',
                fieldLabel: 'inmueble',
                store: InmuebleStore,
                valueField: 'id',
                displayField: 'id',   
                queryMode: 'remote',
                typeAhead: true,
                emptyText:'Seleccionar',
                triggerAction: 'all',
                selecOnFocus: true
			},{
				xtype:'combobox',
                id : 'tiposancion',
                fieldLabel: 'Tipo Sancion',
                store: tiposancionStore,
                valueField: 'id',
                displayField: 'nombre',   
                queryMode: 'remote',
                typeAhead: true,
                emptyText:'Seleccionar',
                triggerAction: 'all',
                selecOnFocus: true
			},{
	             text: '...',
	             xtype: 'button',
	             id: 'nuevotiposancion',
	             x: 260,
	             y: -27,
		        handler:function() {
					nuevotiposancion();
				}
      		},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			},{
				fieldLabel: 'Fecha Realizacion',
				xtype: 'datefield',
				name: 'fecharealizacion',
				id: 'fecharealizacion'
			},{
				fieldLabel: 'Condicion',
				xtype: 'textfield',
				name: 'condicion',
				id: 'condicion'
			},{
				fieldLabel: 'Estado de Solvencia',
				xtype: 'combobox',
				store: edosolvenciastore,
				name: 'edosolvencia',
				id: 'edosolvencia'
			}
			
			];
			this.callParent();
			Ext.getCmp('inmueble').focus();
		}
	});
	

}); //FIN DEL ONREADY

function nuevotiposancion(){
	 //Instanciamos la ventana
   	Ext.create('Ext.window.Window',{
		    		items: [
		    			{
		    				xtype: 'tiposancionView'
		    			}
		    		],
		    		autoScroll: true,
		    		maxHeight: 600
		    	}).show()
}
function guardarsancion() {
  Ext.Ajax.request({
    url: "sanciones/grabarsancion",
    method: "GET",
    params: {
      ajax: "true",
      funcion: "grabarsancion",
      inmueble_id: Ext.getCmp("inmueble").getValue(),
      tiposancion_id: Ext.getCmp("tiposancion").getValue(),
      descripcion: Ext.getCmp("descripcion").getValue(),
      fecharealizacion: Ext.getCmp("fecharealizacion").getValue(),
      condicion: Ext.getCmp("condicion").getValue(),
      edosolvencia: Ext.getCmp("edosolvencia").getValue()
    },
    success: function(resultado, request) {
      var datos;
      datos = Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert("Exito", datos.msg);
      Ext.getCmp("mipanelsanciones").getForm().reset();
    },
    failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado!");
    }
  });
};
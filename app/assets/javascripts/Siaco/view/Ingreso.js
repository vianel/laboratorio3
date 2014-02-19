var ventanatiponovedades = null;
Ext.onReady(function() {
	
	Ext.QuickTips.init();

//MODELO PARA ELCOMBOBOX DE CONCEPTO INGRESOS
Ext.define('Concepto', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'nombre', type: 'string'},
            {name: 'codigo', type: 'string'},
            {name: 'status', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'conceptosingresos/buscar'
           }
});


//Definicion del Data Store
var conceptoStore = Ext.create('Ext.data.Store', {
    model: 'Concepto',
    autoLoad: true,
});


	Ext.define('Siaco.view.Panelingresos', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelIngresos').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					guardaringreso();
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
Ext.define('Siaco.view.Ingreso', {
		extend: 'Siaco.view.Panelingresos',
		xtype: 'ingresoview',
		alias: 'widget.mipanelIngresos',
		id: 'mipanelIngresos',
		title: 'Panel Ingresos',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
		        xtype:'combobox',
		        id : 'conceptoingreso',
		        fieldLabel: 'Concepto',
		        store: conceptoStore,
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
		               id: 'nuevoconceptoingreso',
		               x: 260,
		               y: -27,
		            handler:function() {
		          nuevoconceptoingreso();
		        }
          	},{
				fieldLabel: 'Codigo Ingreso',
				xtype: 'textfield',
				name: 'codigo',
				id: 'codigo'
			},{
				fieldLabel: 'Fecha del ingreso',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fecha',
				id: 'fecha'
			},{
				fieldLabel: 'Monto',
				xtype: 'textfield',
				name: 'monto',
				id: 'monto'
			},{
				fieldLabel: 'Abono',
				xtype: 'textfield',
				name: 'abono',
				id: 'abono'
			},{
		         fieldLabel: 'Pagado',
		         xtype: 'checkboxfield',
		         name: 'pagado',
		         id: 'pagado',
		         x: 5,
		         y: 180,
		         inputValue: '1',
		         uncheckedValue: '0'
       		   }
			];
			this.callParent();
			Ext.getCmp('codigo').focus();
		}
	});
}); //FIN DEL ONREADY

function nuevoconceptoingreso(){
   //Instanciamos la ventana
    Ext.create('Ext.window.Window',{
            items: [
              {
                xtype: 'conceptoingresoView'
              }
            ],
            autoScroll: true,
            maxHeight: 600
          }).show()
}

function guardaringreso()
   {
   		Ext.Ajax.request({
	     url: 'ingresos/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      conceptoingreso: Ext.getCmp('conceptoingreso').getValue(), //obtiene el valor a traves del id del campo
	      codigo: Ext.getCmp('codigo').getValue(),
	      fecha: Ext.getCmp('fecha').getValue(),
	      monto: Ext.getCmp('monto').getValue(),
	      abono: Ext.getCmp('abono').getValue(),
	      pagado: Ext.getCmp('pagado').getValue(),
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelIngresos').getForm().reset();
	     Ext.getForm('tabpanelingresoreservacion').setVisible(true);
	      Ext.getForm('mipanelreservaciones').setVisible(true);

	      //Ext.getForm('mipanelreservaciones').enable();
	     

	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
   }

   
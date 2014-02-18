Ext.onReady(function() {
	
	Ext.QuickTips.init();
	Ext.define('Siaco.view.MiPanelConceptoingresos', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('conceptoingreso').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					guardarconceptoingreso();
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

Ext.define('Siaco.view.ConceptoIngreso', {
		extend: 'Siaco.view.MiPanelConceptoingresos',
		xtype: 'conceptoingresoView',
		alias: 'widget.conceptoingreso',
		id: 'conceptoingreso',
		title: 'NuevoConceptoIngreso',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombreconceptoingreso'
			},{
				fieldLabel: 'Codigo',
				xtype: 'textfield',
				name: 'codigo',
				id: 'codigoconceptoingreso'
			}
			];
			this.callParent();
			Ext.getCmp('nombreconceptoingreso').focus();
		}
	});
});

   function guardarconceptoingreso()
   {
   		Ext.Ajax.request({
	     url: 'conceptosingresos/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      nombre: Ext.getCmp('nombreconceptoingreso').getValue(), //obtiene el valor a traves del id del campo
	      codigo: Ext.getCmp('codigoconceptoingreso').getValue(),
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('conceptoingreso').getForm().reset();
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });
   }
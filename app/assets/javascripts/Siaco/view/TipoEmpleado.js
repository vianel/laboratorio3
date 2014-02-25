Ext.onReady(function() {
	
	Ext.QuickTips.init();
	Ext.define('App.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('paneltipoempleado').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
						guardartipoempleado();
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

Ext.define('Siaco.view.TipoEmpleado', {
		extend: 'App.MiPanel',
		xtype: 'tipoempleadoview',
		alias: 'widget.paneltipoempleado',
		id: 'paneltipoempleado',
		title: 'Tipo Empleado',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Nombre',
				xtype: 'textfield',
				name: 'nombre',
				id: 'nombre'
			},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			},{
				fieldLabel: 'Sueldo Base',
				xtype: 'textfield',
				name: 'sueldobase',
				id: 'sueldobase'
			},{
				fieldLabel: 'Porcentaje Prima hijos',
				xtype: 'textfield',
				name: 'porcentajeprimahijos',
				id: 'porcentajeprimahijos'
			}
			];
			this.callParent();
			Ext.getCmp('nombre').focus();
		}
	});
});

function guardartipoempleado()
{
		Ext.Ajax.request({
     url: 'tipoempleados/grabartipoempleado',
	 method: 'GET',
     //Enviando los parametros a la pagina servidora
     params: {
      ajax: 'true',
      funcion: 'grabartipoempleado',

      nombre: Ext.getCmp('nombre').getValue(), //obtiene el valor a traves del id del campo
      descripcion: Ext.getCmp('descripcion').getValue(),
      sueldobase: Ext.getCmp('sueldobase').getValue(),
      porcentajeprimahijos: Ext.getCmp('porcentajeprimahijos').getValue(),
     },
     //Retorno exitoso de la pagina servidora a traves del formato JSON
     success: function( resultado, request ) {
      datos=Ext.JSON.decode(resultado.responseText);
      Ext.Msg.alert('Exito', datos.msg);
      Ext.getCmp('paneltipoempleado').getForm().reset();
     },
     //No hay retorno de la pagina servidora
     failure: function() {
      Ext.Msg.alert("Error", "Servidor no conectado!");
     }
    });
}
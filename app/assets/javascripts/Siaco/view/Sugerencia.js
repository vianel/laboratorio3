var tabs = null;
var RadiosTiporesidente = new Ext.form.RadioGroup({
		fieldLabel: 'Tipo',
			
		columns: 2,
				items:
				[
				{boxLabel:'Propietario', name:'tipo'},
				{boxLabel:'Inquilino', name:'tipo'}
				]
});
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
						Ext.getCmp('mipanelsugerencia').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					Ext.Msg.alert('Pronto','En construccion');
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
Ext.define('Siaco.view.Sugerencia', {
		extend: 'App.MiPanel',
		xtype: 'sugerenciaview',
		alias: 'widget.mipanelsugerencias',
		id: 'mipanelsugerencias',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Inmueble',
				xtype: 'combobox',
				name: 'inmueble',
				id: 'inmueble'
			},{
				fieldLabel: 'Descripcion',
				xtype: 'textarea',
				name: 'descripcion',
				id: 'descripcion'
			},{
				fieldLabel: 'Fecha',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechasugerencia',
				id: 'fechasugerencia'
			},{
		         fieldLabel: 'Leida',
		         xtype: 'checkboxfield',
		         name: 'leida',
		         id: 'leida',
		         x: 5,
		         y: 180,
		         inputValue: 'true',
		         uncheckedValue: 'false'
		       },
		       	RadiosTiporesidente
		       
			
			];
			this.callParent();
			Ext.getCmp('inmueble').focus();
		}
	});
	
}); //FIN DEL ONREADY
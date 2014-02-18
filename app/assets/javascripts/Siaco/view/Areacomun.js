var tabs = null;
var fotoarbol ="images/arbol.png";
Ext.onReady(function() {
	
	Ext.QuickTips.init();



		Ext.define('Siaco.view.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelareascomunes').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {

         			guardarareacomun();
            
					//Ext.Msg.alert('Pronto','En construccion');
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
Ext.define('Siaco.view.Areacomun', {
		extend: 'Siaco.view.MiPanel',
		xtype: 'areacomunview',
		alias: 'widget.mipanelareascomunes',
		id: 'mipanelareascomunes',
		title: 'Panel Area comun',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
				fieldLabel: 'Codigo',
				xtype: 'textfield',
				name: 'codigo',
				id: 'codigo'
			},{
             text: 'buscar',
             xtype: 'button',
             id: 'buscar',
               iconCls: 'buscar',
             x: 260,
             y: -27,
            handler:function() {
          		buscarareacomun();
          		}
      		},{
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
		         fieldLabel: 'Imagen',
		         xtype: 'textfield',
		          x: 5,
		         y: 210,
		         width: 400 
		        },{
		         xtype: 'textfield',
		         id: 'imagen',
		         x: 110,
		         y: 210,
		         emptyText: fotoarbol,
		         disabled: true,
		       //  width: 295
		        },{
		          xtype: 'image',
		          id: 'imagen0',
		          x: 110,
		          y: 240,
		          border: '',
		          frame: true,
		          height: 110,
		        //  width: 130,
		          src: fotoarbol,
		        },{
		         id: 'imagen1',
		         border: '',
		        /* x: 110,
		         y: 360,*/
		         //atributo accept en algunos navegadores funciona 
		         //para firefox no, accept="image/gif, image/jpeg"
		         html: '<input type="file" size="100" name="ufile[]" id="afile" onchange="previewImage(this)" />',
		        },{
				fieldLabel: 'Capacidad Maxima',
				xtype: 'textfield',
				name: 'capacidad',
				id: 'capacidad'
			},{
				fieldLabel: 'Costo',
				xtype: 'textfield',
				name: 'costo',
				id: 'costo'
			},{
				fieldLabel: 'Costo Invitado',
				xtype: 'textfield',
				name: 'costoinvitado',
				id: 'costoinvitado'
			},{
				fieldLabel: 'hora de Inicio',
				xtype: 'timefield',
				name: 'horainicioareacomun',
				minValue: '6:00 AM',
        		maxValue: '8:00 PM',
				id: 'horainicioareacomun'
			},{
				fieldLabel: 'hora de fin',
				xtype: 'timefield',
				name: 'horafinareacomun',
				id: 'horafinareacomun'
			}
			
			];
			this.callParent();
		}
	});
}); //FIN DEL ONREADY

function guardarareacomun()
{
	   		Ext.Ajax.request({
	     url: 'areascomunes/grabar',
	//	 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      codigo: Ext.getCmp('codigo').getValue(),
	      nombre: Ext.getCmp('nombre').getValue(), //obtiene el valor a traves del id del campo
	      descripcion: Ext.getCmp('descripcion').getValue(),
	      imagen1: encodeURIComponent(document.getElementsByName('ufile[]')[0].value),
		  ufile: document.getElementById('imagen0').src,
	      capacidad: Ext.getCmp('capacidad').getValue(),
	      costo: Ext.getCmp('costo').getValue(),
	      costoinvitado: Ext.getCmp('costoinvitado').getValue(),
		  horainicio: Ext.getCmp('horainicioareacomun').getValue(),
	      horafin: Ext.getCmp('horafinareacomun').getValue(),
	     	     

	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelareascomunes').getForm().reset();
	       document.getElementsByName('ufile[]')[0].value='';
			Ext.getCmp('imagen0').setSrc(fotoarbol);
	     },
	     //No hay retorno de la pagina servidora
	     failure: function() {
	      Ext.Msg.alert("Error", "Servidor no conectado!");
	     }
	    });


}

   function buscarareacomun() {
           Ext.Ajax.request({
             url: 'areascomunes/buscarporcodigo',
			 method: 'GET',
             //Enviando los parametros a la pagina servidora
             params: {
              ajax: 'true',
              funcion: 'buscar',
              codigo: Ext.getCmp('codigo').getValue()
             },
             //Retorno exitoso de la pagina servnombreora a traves del formato JSON
             success: function( resultado, request ) {
              datos=Ext.JSON.decode(resultado.responseText);
              if (datos.exito=='true') {
               	
               Ext.getCmp('nombre').setValue(datos.nombre);
               Ext.getCmp('descripcion').setValue(datos.descripcion);
               Ext.getCmp('imagen0').setSrc(datos.imagen1);
               Ext.getCmp('capacidad').setValue(datos.capacidad);
               Ext.getCmp('costo').setValue(datos.costo);
               Ext.getCmp('costoinvitado').setValue(datos.costoinvitado);
               Ext.getCmp('horainicioareacomun').setValue(datos.horainicio);
               Ext.getCmp('horafinareacomun').setValue(datos.horafin);
              }
              else {
               Ext.Msg.alert("Error", datos.msg);
              }
             },
             //No hay retorno de la pagina servnombreora
             failure: function() {
              Ext.Msg.alert("Error", "Servidor no conectado");
             }
            });    
    
   }
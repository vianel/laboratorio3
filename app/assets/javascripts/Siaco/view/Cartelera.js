var tabs = null;
var guardararchivo = 0;

Ext.onReady(function() {
	
	Ext.QuickTips.init();

//MODELO PARA ELCOMBOBOX DE USUARIOS
Ext.define('Usuario', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'rol_id', type: 'string'},
            {name: 'login', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'usuarios/buscar'
           }
});


//Definicion del Data Store
var UsuarioStore = Ext.create('Ext.data.Store', {
    model: 'Usuario',
    autoLoad: true,
});

//MODELO PARA ELCOMBOBOX DE TIPO PUBLICACIONES
Ext.define('Tipopublicacion', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'codigo', type: 'string'},
            {name: 'inmueble_id', type: 'string'},
            {name: 'nombre', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'tipopublicaciones/buscar'
           }
});


//Definicion del Data Store
var TipopublicacionStore = Ext.create('Ext.data.Store', {
    model: 'Tipopublicacion',
    autoLoad: true,
});
		Ext.define('Siaco.view.MiPanelbotonera', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelcartelera').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					guardarpublicacion();
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
Ext.define('Siaco.view.Subirarchivo',{
extend: 'Siaco.view.MiPanelbotonera',
xtype: 'Subirarchivoview',
title: 'Suba su pdf',
bodyPadding: 5,
width: 450,

  initComponent: function() {
  	this.items = 
  	[
  		{
					         fieldLabel: 'Archivo',
					         xtype: 'textfield',
					         width: 400
					        },{
					         xtype: 'textfield',
					         id: 'planilla',
					   //      x: 110,
					   //      y: 490,
					         disabled: true,
					         emptyText: archivopdf,
					         width: 295
					        },
							{
					         id: 'planilla0',
					         xtype: 'component',
					    //     x: 110,
					  //       y: 520,
					         height: 158,
					         width: 350,
					         autoEl: {
					                  tag: 'iframe',
					                  src: archivopdf
					                 },
					         refreshMe : function(src){
					                      var el;
					                      if(el = this.el){
					                       el.dom.src = src;
					                      }
					                     },
					         listeners : {
					                      render :  function(){
					                       this.refreshMe(archivopdf);
					                      }
					                     }
			        },
					{
			         id: 'planilla1',
			        // x: 110,
			      //   y: 690,
			         border: '',
			         //atributo accept en algunos navegadores funciona 
			         //para firefox no
			         html: '<input type="file"  size="100" name="ufile1[]" id="afile1" onchange="previewPdf(this)" />',
			              
			        }

  	]
  	this.callParent();


  }



});
Ext.define('Siaco.view.Cartelera', {
		extend: 'Siaco.view.MiPanelbotonera',
		xtype: 'carteleraview',
		alias: 'widget.mipanelcartelera',
		id: 'mipanelcartelera',
		title: 'Panel Cartelera',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
				{
			        xtype:'combobox',
			        id : 'combotipopublicacion',
			        fieldLabel: 'Tipo Publicacion',
			        store: TipopublicacionStore,
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
		               id: 'nuevotipopublicacion',
		               x: 260,
		               y: -27,
		            handler:function() {
		          nuevotipopublicacion();
		        }
          			},{
			        xtype:'combobox',
			        id : 'combousuarioreceptor',
			        fieldLabel: 'Para',
			        store: UsuarioStore,
			        valueField: 'id',
			        displayField: 'login',   
			        queryMode: 'remote',
			        typeAhead: true,
			        emptyText:'Seleccionar',
			        triggerAction: 'all',
			        selecOnFocus: true
      			},{
			        fieldLabel: 'Codigo Cartelera',
			        xtype: 'textfield',
			        name: 'codigocartelera',
			        id: 'codigocartelera'
			      },{
			        fieldLabel: 'Titulo',
			        xtype: 'textfield',
			        name: 'titulo',
			        id: 'titulo'
			      },{
			        fieldLabel: 'Descripcion',
			        xtype: 'textarea',
			        name: 'descripcion',
			        id: 'descripcion'
			      },{
					fieldLabel: 'Fecha',
					xtype: 'datefield',
					format: 'd-m-y',
					name: 'fecha',
					id: 'fecha'
				  },{
				  	   text: 'file',
		               iconCls:'rails',
		               xtype: 'button',
		               id: 'subirarchivoid',
		            handler:function() {
		            Ext.Msg.confirm('Subir', '¿Desea subir un archivo?', 
    				 function(btn) {
       				 if(btn === 'yes')
       				 {
       				 	    Ext.create('Ext.window.Window',{
				            items: [
				              {
				                xtype: 'Subirarchivoview',
				              }
				            ],
				            //autoScroll: true,
				          //  maxHeight: 600
				          }).show()
       				 	 guardararchivo = 1;
       				 }
    					});
		        }
          	}
			
			];
			this.callParent();
		}
	});
	
}); //FIN DEL ONREADY

function nuevotipopublicacion(){
   //Instanciamos la ventana
    Ext.create('Ext.window.Window',{
            items: [
              {
                xtype: 'tipopublicacionView'
              }
            ],
            autoScroll: true,
            maxHeight: 600
          }).show()
}
function guardarpublicacion()
   {

   		Ext.Ajax.request({
	     url: 'carteleras/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

	      combotipopublicacion: Ext.getCmp('combotipopublicacion').getValue(), //obtiene el valor a traves del id del campo
	      combousuarioreceptor: Ext.getCmp('combousuarioreceptor').getValue(),
	      codigocartelera: Ext.getCmp('codigocartelera').getValue(),
	      titulo: Ext.getCmp('titulo').getValue(),
	      descripcion: Ext.getCmp('descripcion').getValue(),
	      fecha: Ext.getCmp('fecha').getValue(),
	   	
	    /* imagen1: encodeURIComponent(document.getElementsByName('ufile1[]')[0].value),
         ufile1: document.getElementById('planilla0').src,
          */            

	      
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
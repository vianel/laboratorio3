var tabs = null;
archivopdf = "helloworld.pdf";
//var arregloareacomun = Ext.create('Siaco.store.Areascomunes');
   function checkFileExtension(elem) {
        var filePath = elem;

        if(filePath.indexOf('.') == -1)
            return false;
                  
        var validExtensions = new Array();
        var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();
    
        if (typeExtension=="image") {
         validExtensions[0] = 'jpg';
         validExtensions[1] = 'jpeg';
         validExtensions[3] = 'png';
         validExtensions[4] = 'gif'; 
        }
        else {
         validExtensions[0] = 'pdf';
        }   

        for(var i = 0; i < validExtensions.length; i++) {
            if(ext == validExtensions[i])
                return true;
        }

        Ext.Msg.alert('Advertencia', 'La extension .'+ext+' del archivo ' + filePath + ' no es permitida!');
        if (typeExtension=="image") {
         document.getElementsByName('ufile[]')[0].value='';
         Ext.getCmp('imagen0').setSrc('images/transporte.jpg'); 
        }
        else {
         document.getElementsByName('ufile1[]')[0].value='';
         Ext.getCmp('imagen0').setSrc('helloworld.pdf');	
        } 
        return false;
    }
function previewPdf(input) {
	typeExtension="pdf";
	if (!checkFileExtension(encodeURIComponent(document.getElementsByName("ufile1[]")[0].value)))
	{
	 return false;	
	}
	if (input.files && input.files[0]) {
  var reader = new FileReader();
  reader.onload = function (e) {
   document.getElementById('planilla0').src = e.target.result
   archivopdf = input.files[0].name;
  }
  reader.readAsDataURL(input.files[0]);
}

}
Ext.onReady(function() {
	

	Ext.QuickTips.init();

//Definicion del Modelo
Ext.define('Areacomun', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'condominio_id', type: 'string'},
            {name: 'codigo', type: 'string'},
            {name: 'nombre', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'areascomunes/buscar'
           }
});

//Definicion del Data Store
var areacomunStore = Ext.create('Ext.data.Store', {
    model: 'Areacomun',
    autoLoad: true,
});


//var storeareacomun = Ext.getStore('areascomunesStore');
//	storeareacomun.sync();
		Ext.define('Siaco.view.MiPanel', {
		extend: 'Ext.form.Panel',
		
		initComponent : function() {
			this.dockedItems = [{
				dock: 'bottom',
				buttons: [{
					text: 'Limpiar',
					iconCls:'limpiar',
					handler: function() {
						Ext.getCmp('mipanelreservaciones').getForm().reset();
					}
					
				},{
				text: 'Grabar',
				iconCls:'grabar',
				handler:function() {
					guardarreservacion();
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
Ext.define('Siaco.view.Reservacion', {
		extend: 'Siaco.view.MiPanel',
		xtype: 'reservacionview',
		alias: 'widget.mipanelreservaciones',
		id: 'mipanelreservaciones',
		title: 'Reservar',
		bodyPadding: 5,
		width: 450,
		
		initComponent: function () {
			
			this.items = [
			{
			    xtype:'combobox',
                id : 'areacomun',
                fieldLabel: 'Area Comun',
                store: areacomunStore,
                valueField: 'id',
                displayField: 'nombre',   
                queryMode: 'remote',
                typeAhead: true,
                emptyText:'Seleccionar',
                triggerAction: 'all',
                selecOnFocus: true,
			},{
				fieldLabel: 'Codigode Reservacion',
				xtype: 'textfield',
				name: 'codigoreservacion',
				id: 'codigoreservacion'
			},{
				fieldLabel: 'Fecha de Uso',
				xtype: 'datefield',
				format: 'd-m-y',
				name: 'fechauso',
				id: 'fechauso'
			},{
				fieldLabel: 'hora de Inicio',
				xtype: 'timefield',
				name: 'horainicio',
				minValue: '6:00 AM',
        		maxValue: '8:00 PM',
				id: 'horainicio'
			},{
				fieldLabel: 'hora de fin',
				xtype: 'timefield',
				name: 'horafin',
				id: 'horafin'
			},{
				fieldLabel: 'Numero de Invitados',
				xtype: 'textfield',
				name: 'nroinvitados',
				id: 'nroinvitados'
			},{
				fieldLabel: 'Observaciones',
				xtype: 'textfield',
				name: 'observaciones',
				id: 'observaciones'
			},{
		         fieldLabel: 'Lista de Invitados',
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
			
			];
			this.callParent();
		}
	});



}); //FIN DEL ONREADY

function guardarreservacion()
   {
   		Ext.Ajax.request({
	     url: 'reservaciones/grabar',
		 method: 'GET',
	     //Enviando los parametros a la pagina servidora
	     params: {
	      ajax: 'true',
	      funcion: 'grabar',

     	              areacomun: Ext.getCmp('areacomun').getValue(),  //obtiene el valor a traves del id del campo
                      codigo: Ext.getCmp('codigoreservacion').getValue(), //Este id nombret debe ser unico, ya que el 
       			      fechauso: Ext.getCmp('fechauso').getValue(),
                      horainicio: Ext.getCmp('horainicio').getValue(),
                      horafin: Ext.getCmp('horafin').getValue(),
                      nroinvitados: Ext.getCmp('nroinvitados').getValue(),
                      planilla1: encodeURIComponent(document.getElementsByName('ufile1[]')[0].value),
					  //planilla1: document.getElementById("afile1").files[0].fileName,
                      ufile1: document.getElementById('planilla0').src,
                      observaciones: Ext.getCmp('observaciones').getValue()
	     },
	     //Retorno exitoso de la pagina servidora a traves del formato JSON
	     success: function( resultado, request ) {
	      datos=Ext.JSON.decode(resultado.responseText);
	      Ext.Msg.alert('Exito', datos.msg);
	      Ext.getCmp('mipanelreservaciones').getForm().reset();
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
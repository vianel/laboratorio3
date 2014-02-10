      Ext.onReady(function(){
	
	  //PRUEBA DEL SERVICIO DESDE EXTJS
	  
	  var dialogo = Ext.create('Ext.window.Window', {
	      title: "Buscar Cedula",
	      id: 'panelServicio1',
	      width: 255,
	      height: 90,
	      layout: 'absolute',
	      items: [{
			xtype: 'label',
			text: 'Cedula',
			x: 10,
			y: 13
		      },{
			xtype: 'textfield',
			id: 'id_cedrif',
			value: '',
			x: 70,
			y: 10
		      },{
			xtype: 'button',
			text: 'Buscar',
			x: 100,
			y: 40,
			listeners: {
			  click: function () {
			    enviar(Ext.getCmp('id_cedrif').value);
			  }
			}
		      }]
      });
      //dialogo.show();

	  
      });



      function enviar(id_cedrif) {
	Ext.Ajax.request({
		//Llamar la direcion del servicio
		url : 'http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=1',
		//parametro de entrada
		params : {
		  cedRifPersona: id_cedrif
		},
		success : function(resultado, request) {
			//La tira JSON donde retorna los valores
			datos = Ext.JSON.decode(resultado.responseText);
			
			var mensaje;
			if (datos.exito == true) {
				mensaje = "La cedula pertenece a " + datos.nombre +" " + datos.apellido +", direccion " + datos.direccion +"";
			} else {
				mensaje = "La cedula no existe";
			}
			
			Ext.MessageBox.show({
				title : 'Respuesta',
				msg : mensaje,
				width : 400,
				buttons : Ext.MessageBox.OK
			});
		},
		failure : function(error) {
			Ext.Msg.alert("Error", "Servidor no conectado");
		}
	});

      };
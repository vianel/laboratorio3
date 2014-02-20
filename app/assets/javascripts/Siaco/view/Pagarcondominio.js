 var typeExtension="image";
var archivopdf=null;
    //Funcion para validar la extension
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
	typeExtension = "pdf";
	if (!checkFileExtension(encodeURIComponent(document.getElementsByName("ufile1[]")[0].value))) {
		return false;
	}
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('planilla0').src = e.target.result
			archivopdf = input.files[0].name;
		}
		reader.readAsDataURL(input.files[0]);
	}

}

    
 Ext.onReady(function() {
  
  Ext.QuickTips.init();

//MODELO PARA EL CATALOGO BANCOS
Ext.define("Banco", {
  extend: 'Ext.data.Model',
  fields: [
    {
      name: 'id', 
      type: 'string'
    },{
      name: 'nombre',
      type: 'string'
    }

  ]
});

//STORE LISTA DE BANCOS
bancosStore = Ext.create('Ext.data.Store', {
  model: 'Banco',
  proxy: {
    type: 'ajax',
    url: 'http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=2',
    reader: {
      type: 'json',
      root: 'datosBancos',

    }
  },
  autoLoad: true
});

Ext.define('Siaco.view.Bancosgrid', {
    extend: 'Ext.grid.Panel',
  //  store: Ext.create('Siaco.store.Propietarios'),
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.bancosgrid',
    xtype: 'bancosgrid',
    

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas  del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "ID", flex: 1, dataIndex: 'id', sortable: true},
            {text: "Nombre", flex: 1, dataIndex: 'nombre', sortable: true},    
        ];
        this.dockedItems = [ {
    xtype: 'toolbar',
    dock: 'bottom',
    items: [
    
     { xtype: 'button',
                    text: 'Aceptar',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       if (data!=null) {
                        Seleccionarpropietario();
                     
                       }
                       else {
                        alert("No ha seleccionado un item."); 
                       }
                      }
                    }
                },    
    ]
  } ];

  
  //this.verticalScroller = {xtype: 'paginggridscroller'};
                 this.store = bancosStore;
        this.forceFit = true;
            this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                          },
                          specialkey: function(field, e){
                            if (e.getKey() == e.ENTER) {
                              data = this.getSelectionModel().selected.items[0].data;
                              if (data!=null) {
                                 Seleccionarpropietario();
                                }
                            }
                          }
                         };;
        //Llamamos a la super clase a iniciacion del componente
        this.callParent();
    }
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
            Ext.getCmp('mipanelpagocondominio').getForm().reset();
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

  
  Ext.define('Siaco.view.Pagarcondominio', {
    extend: 'App.MiPanel',
    xtype: 'pagarcondominioview',
    alias: 'widget.mipanelpagocondominio',
    id: 'mipanelpagocondominio',
    title: 'Pagar condominio',
    bodyPadding: 5,
    width: 450,
    
    initComponent: function () {
      
      this.items = [
     {
        fieldLabel: 'Vocuher',
        xtype: 'textfield',
        name: 'voucher',
        id: 'voucher'
      },{
        fieldLabel: 'Fecha del deposito',
        xtype: 'datefield',
        name: 'fechadeldeposito',
        id: 'fechadeldeposito'
      },{

        xtype: 'bancosgrid',
        heigth: 100
      }
      ];
      this.callParent();
      Ext.getCmp('voucher').focus();
    }
  });

  
}); //FIN DEL ONREADY
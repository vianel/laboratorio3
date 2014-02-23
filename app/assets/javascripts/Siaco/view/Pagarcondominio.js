 var typeExtension="image";
var archivopdf=null;
    
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

//MODELO PARA ELCOMBOBOX DE CONCEPTO INGRESOS
Ext.define('Tipopago', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'string'},
            {name: 'nombre', type: 'string'},
            {name: 'codigo', type: 'string'},
            {name: 'status', type: 'string'},
           ],
           proxy: {
            type: 'ajax',
            url : 'tipopagos/buscar'
           }
});


//Definicion del Data Store
var tipopagoStore = Ext.create('Ext.data.Store', {
    model: 'Tipopago',
    autoLoad: true,
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
          guardarpago();
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
        fieldLabel: 'Codigo',
        xtype: 'textfield',
        name: 'codigo',
        id: 'codigo'
      },{
          xtype:'combobox',
          id : 'tipodepago',
          fieldLabel: 'Tipo de pago',
          store: tipopagoStore,
          valueField: 'id',
          displayField: 'nombre',   
          queryMode: 'remote',
          typeAhead: true,
          emptyText:'Seleccionar',
          triggerAction: 'all',
          selecOnFocus: true,
      },{
           text: '...',
           xtype: 'button',
           id: 'nuevotipodepago',
           x: 260,
           y: -27,
        handler:function() {
      nuevotipodepago();
              }
      },{
        fieldLabel: 'Banco',
        xtype: 'textfield',
        name: 'banco',
        id: 'banco'
      },{
        fieldLabel: 'Cuenta',
        xtype: 'textfield',
        name: 'cuenta',
        id: 'cuenta'
      },{
        fieldLabel: 'Voucher',
        xtype: 'textfield',
        name: 'voucher',
        id: 'voucher'
      },{
        fieldLabel: 'Monto',
        xtype: 'textfield',
        name: 'monto',
        id: 'monto'
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
            }
      ];
      this.callParent();
    }
  });

  
}); //FIN DEL ONREADY

 function nuevotipodepago(){
   //Instanciamos la ventana
    Ext.create('Ext.window.Window',{
            items: [
              {
                xtype: 'tipopagoView'
              }
            ],
            autoScroll: true,
            maxHeight: 600
          }).show()
}
function guardarpago()
{
  Ext.Ajax.request({
   url: 'recibospagos/grabar',
  //   method: 'GET',
   //Enviando los parametros a la pagina servidora
   params: {
    ajax: 'true',
    funcion: 'grabar',
    tipodepago: Ext.getCmp('tipodepago').getValue(),
    banco: Ext.getCmp('banco').getValue(),
    cuenta: Ext.getCmp('cuenta').getValue(), //obtiene el valor a traves del id del campo
    voucher: Ext.getCmp('voucher').getValue(),
    monto: Ext.getCmp('monto').getValue(),
    imagen1: encodeURIComponent(document.getElementsByName('ufile[]')[0].value),
    ufile: document.getElementById('imagen0').src,

         

   },
   //Retorno exitoso de la pagina servidora a traves del formato JSON
   success: function( resultado, request ) {
    datos=Ext.JSON.decode(resultado.responseText);
    Ext.Msg.alert('Exito', datos.msg);
    Ext.getCmp('mipanelpagocondominio').getForm().reset();
     document.getElementsByName('ufile[]')[0].value='';
  Ext.getCmp('imagen0').setSrc(fotoarbol);
   },
   //No hay retorno de la pagina servidora
   failure: function() {
    Ext.Msg.alert("Error", "Servidor no conectado!");
   }
      });
}
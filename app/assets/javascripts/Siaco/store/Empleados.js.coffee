   Ext.define 'Siaco.store.Empleados', 
    storeId: 'empleadosStore'
    extend: 'Ext.data.Store'
    model: 'Siaco.model.Empleado'
    autoLoad: true
    proxy: {
              type: 'ajax',
              url : '/empleados/catalogo'
              reader: {
                  type: 'json',
                  root: 'datos'
              }
          }


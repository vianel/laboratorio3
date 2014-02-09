Ext.define 'Siaco.store.Propietarios',
    storeId: 'propietariosStore'
    extend: 'Ext.data.Store'
    model: 'Siaco.model.Propietario'
    proxy:
        type: 'ajax'
        url: '/propietarios'
        reader:
            type: 'json'
            root: 'propietarios'
    autoLoad: true
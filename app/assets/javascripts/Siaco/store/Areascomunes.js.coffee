Ext.define 'Siaco.store.Areascomunes',
  storeI: 'areascomunesStore'
  extend: 'Ext.data.Store'
  model: 'Siaco.model.Areacomun'
  autoLoad: true
  proxy:
    type: "ajax"
    url: "areascomunes/buscar"
    reader:
      type: "json"
      root: "datos"
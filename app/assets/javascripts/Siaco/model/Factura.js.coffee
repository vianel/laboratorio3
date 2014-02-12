Ext.define "Siaco.model.Factura",
  extend: "Ext.data.Model"
  fields: [
    {
      name: "id"
      type: "string"
    }
    {
      name: "subtotal"
      type: "string"
    }
    {
      name: "iva"
      type: "string"
    }
    {
      name: "status"
      type: "string"
    }
  ]
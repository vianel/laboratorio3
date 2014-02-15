Ext.define "Siaco.model.Sancion",
  extend: "Ext.data.Model"
  fields: [
    {
      name: "id"
      type: "string"
    }
    {
      name: "inmueble_id"
      type: "string"
    }
    {
      name: "tipo_id"
      type: "string"
    }
    {
      name: "descripcion"
      type: "string"
    }
    {
      name: "fecha_realizacion"
      type: "date"
    }
    {
      name: "condicion"
      type: "string"
    }
    {
      name: "estado_solvencia"
      type: "string"
    }
    {
      name: "status"
      type: "string"
    }
  ]
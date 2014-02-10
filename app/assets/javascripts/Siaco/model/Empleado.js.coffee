Ext.define "Siaco.model.Empleado", 
    extend: 'Ext.data.Model'
    fields: [
        {name: 'NOMBRE',  type: 'string'}
        {name: 'APELLIDO',  type: 'string'}
        {name: 'CEDULA',   type: 'string'}
        {name: 'DIRECCION_ALTERNATIVA',   type: 'string'}
        {name: 'TELEFONO',   type: 'string'}
        {name: 'EMAIL',   type: 'string'}
        {name: 'SEXO',   type: 'string'}
        {name: 'FECHA_NACIMIENTO',   type: 'date'}
    ]
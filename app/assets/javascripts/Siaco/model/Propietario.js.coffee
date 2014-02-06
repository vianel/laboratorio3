Ext.define "Siaco.model.Propietario",
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
        {name: 'ESTADO_CIVIL',   type: 'string'}
        {name: 'FOTO',   type: 'string'}
        {name: 'CONDOMINIO_ID',   type: 'int'}
        {name: 'USUARIOS_ID',   type: 'int'}
        {name: 'CARGO_JUNTA_ONDOMINIO_ID',   type: 'int'}
    ]
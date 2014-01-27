Ext.define "Siaco.controller.Reservacion",
	extend: "Ext.app.Controller"
	refs: [
		{
			ref: 'reservacionView'
			selector: 'reservacionView'
		}
	]

	init: ->
		@control
			'ReservacionView':
				reservacion: @onReservacion

	onReservacion: (inmuebleid, areacomunid,fechareservacion,fechainicio,fechafinalizacion) ->
		Ext.Ajax.request
			url: 'reservaciones/grabar'
			method: 'GET'
			params:
				inmuebleid: inmuebleid
				areacomunid: areacomunid
				fechareservacion: fechareservacion
				fechainicio: fechainicio
				fechafinalizacion: fechafinalizacion
			success: (resultado, request) =>
				datos = Ext.JSON.decode(resultado.responseText)
				
			failure: ->
				Ext.Msg.alert("Error", "Servidor no conectado")
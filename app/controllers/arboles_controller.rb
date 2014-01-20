class ArbolesController < ApplicationController
	def index
		#render json: Arbol.where("tipo = ? AND padre_id = ?", params[:tipo], params[:padre_id])
		render json: [
			{id: 1, text: 'Inventario', vinculo: 'inventarioView', leaf: true},
			{id: 2, text: 'Empleado', vinculo: 'empleadosview', leaf: true},
			{id: 3, text: 'Areacomun', vinculo: 'areacomunview', leaf: true},
			{id: 4, text: 'Inmueble', vinculo: 'inmuebleview', leaf: true},
			{id: 5, text: 'Pagarconominio', vinculo: 'pagarcondominioview', leaf: true},
			{id: 6, text: 'Requisicion', vinculo: 'requisicionview', leaf: true},
			{id: 7, text: 'Sancion', vinculo: 'sancionview', leaf: true},
			{id: 8, text: 'Administrador', vinculo: 'administradorview', leaf: true}					
		]
	end
end
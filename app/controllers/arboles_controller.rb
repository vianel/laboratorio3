class ArbolesController < ApplicationController
	def index
		#render json: Arbol.where("tipo = ? AND padre_id = ?", params[:tipo], params[:padre_id])
		render json: [
			{id: 1, text: 'Inventario', vinculo: 'inventarioView', leaf: true},
			{id: 2, text: 'Empleado', vinculo: 'empleadosview', leaf: true}
		]
	end
end
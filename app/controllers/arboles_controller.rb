class ArbolesController < ApplicationController
	def index
		render json: Arbol.where("tipo = ? AND padre_id = ?", params[:tipo], params[:padre_id])
	end
end
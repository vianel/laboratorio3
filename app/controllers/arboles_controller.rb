class ArbolesController < ApplicationController
	def index
		puts $usuario.ID
		resultado = []
		InterfazRol.where(ID: $usuario.ID).each do |interfaz_rol|
			resultado << {id: interfaz_rol.INTERFACES_ID, text: interfaz_rol.interfaz.DESCRIPCION, vinculo: interfaz_rol.VINCULO,leaf: true}
		end
		render json: resultado
	end
end
class ArbolesController < ApplicationController
	def index
		puts $usuario.ID
		resultado = []

		InterfazRol.where(ID: $usuario.ID).each do |interfaz_rol|
			if interfaz_rol.interfaz.STATUS == "M"
			resultado << {text: interfaz_rol.interfaz.DESCRIPCION,childNode: true}
			end

			resultado << {id: interfaz_rol.INTERFACES_ID, text: interfaz_rol.interfaz.DESCRIPCION, vinculo: interfaz_rol.VINCULO,leaf: true}
		
		end
		render json: resultado
	end
end
class ArbolesController < ApplicationController
	def index
		puts $usuario.id
		resultado = []

		InterfazRol.where(rol__id: $usuario.id).each do |interfaz_rol|
	#		if interfaz_rol.interfaz.STATUS == "M"
	#		resultado << {text: interfaz_rol.interfaz.DESCRIPCION,childNode: true}
	#		end

			resultado << {rol__id: interfaz_rol.interfaces_id, text: interfaz_rol.interfaz.descripcion, vinculo: interfaz_rol.vinculo,leaf: true}
		
		end
		render json: resultado
	end
end
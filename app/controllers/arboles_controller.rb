class ArbolesController < ApplicationController
	def index
		puts $usuario.id
		resultado = []

		Arbol.where(rol_id: $usuario.id).each do |arbol|
	#		if arbol.interfaz.STATUS == "M"
	#		resultado << {text: arbol.interfaz.DESCRIPCION,childNode: true}
	#		end

			resultado << {rol_id: arbol.id, text: arbol.texto, vinculo: arbol.vinculo,leaf: true}
		
		end
		render json: resultado
	end
end
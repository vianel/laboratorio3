class ArbolesController < ApplicationController
	def index
		#puts $usuario.id
		resultado = []

		Arbol.where(rol_id: $usuario.rol_id).each do |arbol|
	#		if arbol.interfaz.STATUS == "M"
	#		resultado << {text: arbol.interfaz.DESCRIPCION,childNode: true}
	#		end

			resultado << {rol_id: arbol.rol_id, text: arbol.texto, vinculo: arbol.vinculo,leaf: true}
		
		end
		render json: resultado
	end
end
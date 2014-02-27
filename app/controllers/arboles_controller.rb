class ArbolesController < ApplicationController
	def index
		#puts $usuario.id
		resultado = []

=begin		Arbol.where(rol_id: $usuario.rol_id, status: 'M').each do |arbol|

			resultado << {rol_id: arbol.rol_id, text: arbol.texto}
			#render json: resultado


		end
			resultado << "  children: [ "
					Arbol.where(rol_id: $usuario.rol_id, status: 'A').each do |arbol|
			resultado << {rol_id: arbol.rol_id, text: arbol.texto, vinculo: arbol.vinculo,leaf: true}

		end
		resultado << "]"
=end
	    Arbol.where(rol_id: $usuario.rol_id).each do |arbol|

			resultado << {rol_id: arbol.rol_id, text: arbol.texto, vinculo: arbol.vinculo,leaf: true}
		
		end	

	

		render json: resultado
	end
end
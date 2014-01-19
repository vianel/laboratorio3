module ApplicationHelper
	def validar_sesion
		render json: $usuario.nil?
	end
	def salir
		$usuario
		render json: nil
	end
end

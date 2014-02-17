class SesionesController < ApplicationController
	def entrar

		$usuario = Usuario.find_by(LOGIN: params[:login], PASSWORD: params[:password])
		buscarcondominio
		render json: { exito: !$usuario.nil?}

	end

	def buscarcondominio
		if $usuario.rol_id == 1
		@administrador = Administrador.find_by(usuario_id: $usuario.id)
		$condominio = Modelocondominio.find_by(id: @administrador.condominio_id)
		end
		if $usuario.rol_id == 2
		@inmueble = Inmueble.find_by(usuario_id: $usuario.id)
		$condominio = Modelocondominio.find_by(id: @inmueble.condominio_id)
		end
		if $usuario.rol_id == 3
		
		end
		puts $condominio.nombre

	end
end
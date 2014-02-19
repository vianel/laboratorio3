class SesionesController < ApplicationController
	def entrar

		$usuario = Usuario.find_by(login: params[:login], password: params[:password])
		render json: { exito: !$usuario.nil? }
		

	end

	def buscarcondominio
		if $usuario.rol_id == 1
		@administrador = Administrador.find_by(usuario_id: $usuario.id)
		$condominio = Modelocondominio.find_by(id: @administrador.condominio_id)
		$inmueble.numero = "Admin"
		elsif $usuario.rol_id == 2
		$inmueble = Inmueble.find_by(usuario_id: $usuario.id)
		$condominio = Modelocondominio.find_by(id: $inmueble.condominio_id)
		puts $inmueble.numero

		elsif $usuario.rol_id == 3	
			$condominio.nombre = "usuario"
			$inmueble.numero = "root"
		end
		puts $condominio.nombre
	   $tirajson = '{"success": "true", 
	        "exito": "true"  ,"nombre": "'        	+$condominio.nombre.to_s+
	               '", "inmueble": "'     +$inmueble.numero.to_s+'"  }'

		
		render :text => $tirajson

	end


end
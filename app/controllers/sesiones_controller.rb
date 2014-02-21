class SesionesController < ApplicationController
	def entrar

		$usuario = Usuario.find_by(login: params[:login], password: params[:password])
		render json: { exito: !$usuario.nil? }
		

	end

	def buscarcondominio
		if $usuario.rol_id == 1
		@administrador = Administrador.find_by(usuario_id: $usuario.id)
		$condominio = Modelocondominio.find_by(id: @administrador.condominio_id)

			   $tirajson = '{"success": "true", 
      		"exito": "true"  ,"nombre": "'        	+$condominio.nombre.to_s+
       		'", "nomprepropietario": "'      +@administrador.nombre.to_s+
				'", "inmueble": "Admin"  }'
		elsif $usuario.rol_id == 2
		$inmueble = Inmueble.find_by(usuario_id: $usuario.id)
		$condominio = Modelocondominio.find_by(id: $inmueble.condominio_id)
		$propietario = Propietario.find_by(id: $inmueble.propietario_id)
		puts $inmueble.numero
			   $tirajson = '{"success": "true", 
                  		"exito": "true"  ,"nombre": "'        	+$condominio.nombre.to_s+
                   		'", "nomprepropietario": "'      +$propietario.nombre.to_s+
           				'", "inmueble": "'     +$inmueble.numero.to_s+'"  }'

		elsif $usuario.rol_id == 3	
			$tirajson = '{"success": "true", 
	        "exito": "true"  ,"nombre": "usuario", "inmueble": "root"  }'
		end
	


		
		render :text => $tirajson

	end

	def buscarpublicacionesencartelera
		@cartelera = Cartelera.find(:last, :conditions => {:usuario_receptor_id => $usuario.id})
		if @cartelera != nil 
			$tirajson = '{"success": "true", 
      		"exito": "true"  ,"titulo": "'        	+@cartelera.titulo.to_s+
       		'", "descripcion": "'      +@cartelera.descripcion.to_s+
				'", "fecha": "'     +@cartelera.fecha.to_s+'"   }'
		render :text => $tirajson
		end

	end


end
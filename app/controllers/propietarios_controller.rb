class PropietariosController < ApplicationController


	
  def grabarpropietario


    @datos = []
    @datos[0] = params[:nombre]
    @datos[1] = params[:apellido]
    @datos[2] = params[:cedula]
    @datos[3] = params[:fechanacimiento]
    @datos[4] = params[:direccion]
    @datos[5] = params[:telefono]
    @datos[6] = params[:celular]
    @datos[7] = params[:imagen1]
    @datos[8] = params[:estadocivil]
    @propietario = Propietario.new
    valor = @propietario.grabar(@datos,params[:ufile])
    render :text => $tirajson
  

  end
  	def obtenerPersona
	  curl = CURL.new
	  contenido = curl.get("http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=1&cedRifPersona='#{params[:cedula]}'")
    if contenido != nil
             $tirajson = '{"exito": "1"  , 
                                   "ci_rif": "'          +contenido.ci_rif.to_s+
                                   '", "nombre": "'      +contenido.nombre.to_s+
                                   '", "apellido": "'      +contenido.apellido.to_s+
                                   '", "fechanacimiento": "'      +contenido.fecha_nacimiento.to_s+
                                   '", "sexo": "'      +contenido.sexo.to_s+
                                   '", "estadocivil": "'      +contenido.estado_civil.to_s+
                                   '", "direccion": "'      +contenido.direccion.to_s+
                                   '", "telefono": "'      +contenido.telefono.to_s+
                           '", "correo": "'     +contenido.correo.to_s+'"  }'
    else
    
    $tirajson = '{ "success": "1", "msg": "Codigo no existe!" }'
    end

=begin  j=ActiveSupport::JSON
	    #convertir como arreglo
	  @cedula = j.decode(contenido).to_a[1][1].to_s
	  @nombre = j.decode(contenido).to_a[2][1].to_s
	  @apellido = j.decode(contenido).to_a[3][1].to_s
	  @fechaNacimiento = j.decode(contenido).to_a[4][1].to_s
	  @sexo = j.decode(contenido).to_a[5][1].to_s
	  @estadoCivil = j.decode(contenido).to_a[6][1].to_s
	  @direccion = j.decode(contenido).to_a[7][1].to_s
	  @telefono = j.decode(contenido).to_a[8][1].to_s
	  @correo = j.decode(contenido).to_a[9][1].to_s
	    #imprimimos por consola para probar
=end
    render :text => $tirajson
      end
   def catalogo
   @propietarios = Propietario.new
   $tirajson=@propietarios.catalogo()
   render :text => $tirajson  
  end

end
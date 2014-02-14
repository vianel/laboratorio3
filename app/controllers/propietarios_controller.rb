class PropietariosController < ApplicationController
	before_action :set_propietario, only: [:update, :destroy]#:show, :edit]
	respond_to :json

	def index
		
	end

	
  def grabar


    @datos = []
    @datos[0] = params[:nombre]
    @datos[1] = params[:apellido]
    @datos[2] = params[:telefono]
    @datos[3] = params[:correo]
    @datos[4] = params[:sexo]
    @datos[5] = params[:fechanacimiento]
    @datos[6] = params[:login]
    @datos[7] = params[:cargojunta]
    @propietario = Propietario.new
    valor = @propietario.grabar(@datos)
    render :text => $tirajson
  end
  	def obtenerPersona
	  curl = CURL.new
	  contenido = curl.get("http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=1&cedRifPersona=V-18560575-1")
	  j=ActiveSupport::JSON
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
	  puts("cedula: "+@cedula)
	  puts("nombre: "+@nombre)
	  puts("estadoCivil: "+@estadoCivil)
      end
   def catalogo
   @propietarios = Propietario.new
   $tirajson=@propietarios.catalogo()
   render :text => $tirajson  
  end

end
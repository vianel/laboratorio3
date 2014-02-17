class InmueblesController < ApplicationController
  def index
  end


    def grabarinmueble

	@propietario = Propietario.new
	@idpropietario = @propietario.buscar(params[:cedula])   

    @datos = []
    #@datos[0] = 1
    @datos[0] = $condominio.id
    @datos[1] = @idpropietario
    @datos[2] = params[:usuario]
    @datos[3] = params[:codigoinmueble]
    @datos[4] = params[:nroapartamento]
    @datos[5] = params[:alicueota]
    @datos[6] = params[:saldoinmueble]
    @datos[7] = params[:edosolvencia]
    @inmueble = Inmueble.new
    valor = @inmueble.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end

  def buscar
      @inmuebles = Inmueble.new
   $tirajson=@inmuebles.buscar()
   render :text => $tirajson  

  end
end

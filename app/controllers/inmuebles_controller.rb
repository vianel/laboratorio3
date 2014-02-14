class InmueblesController < ApplicationController
  def index
  end


    def grabarinmueble

	@propietario = Propietario.new
	@idpropietario = @propietario.buscar(params[:cedula])   

    @datos = []
    #@datos[0] = 1
    @datos[0] = '1'
    @datos[1] = @idpropietario
    @datos[2] = '1'
    @datos[3] = params[:alicuota]
    @datos[4] = params[:nroapartamento]
    @datos[5] = params[:edosolvencia]
    @datos[6] = 'A'
    @inmueble = Inmueble.new
    valor = @inmueble.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end
end

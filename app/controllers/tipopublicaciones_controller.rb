class TipopublicacionesController < ApplicationController
  def index
  end

    def grabar
  	@datos = []

    @datos[0] = params[:codigo]
    @datos[1] = params[:nombre]
    @datos[2] = params[:descripcion]
    @datos[3] = 'A'
    @tipopublicaciones = Tipopublicacion.new
    valor = @tipopublicaciones.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end
  def buscar
   @tipopublicaciones = Tipopublicacion.new
   $tirajson=@tipopublicaciones.buscar()
   render :text => $tirajson  
  end
end

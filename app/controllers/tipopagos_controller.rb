class TipopagosController < ApplicationController
  def index
  end
    def grabar
  	@datos = []

    @datos[0] = params[:codigo]
    @datos[1] = params[:nombre]
    @datos[2] = 'A'
    @tipopagos = Tipopago.new
    valor = @tipopagos.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end

     def buscar
   @tipopagos = Tipopago.new
   $tirajson=@tipopagos.buscar()
   render :text => $tirajson  
  end
end

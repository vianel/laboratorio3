class ConceptosingresosController < ApplicationController
  def index
  end

  def grabar
  	@datos = []

    @datos[0] = params[:codigo]
    @datos[1] = params[:nombre]
    @datos[2] = 'A'
    @conceptosingresos = Conceptoingreso.new
    valor = @conceptosingresos.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end

     def buscar
   @conceptosingresos = Conceptoingreso.new
   $tirajson=@conceptosingresos.buscar()
   render :text => $tirajson  
  end
end

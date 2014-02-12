class AreascomunesController < ApplicationController
  def index
  end
  def grabar


    @datos = []
    #@datos[0] = 1
    @datos[0] = params[:nombre]
    @datos[1] = params[:descripcion]
    @datos[2] = params[:costo]
    @datos[3] = 'A'
    @areacomun = Areacomun.new
    valor = @areacomun.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end

  def buscar
   @areasacomunes = Areacomun.new
   $tirajson=@areasacomunes.buscar()
   render :text => $tirajson  
  end
end

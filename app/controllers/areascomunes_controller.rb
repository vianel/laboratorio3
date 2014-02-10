class AreascomunesController < ApplicationController
  def index
  end
  def grabar


    @datos = []
    @datos[0] = 1
    @datos[1] = 1
    @datos[2] = params[:nombre]
    @datos[3] = params[:descripcion]
    @datos[4] = params[:costo]
    @datos[5] = 'A'
    @areacomun = Areacomun.new
    valor = @areacomun.grabar(@datos)
    render :text => $tirajson

  end

  def buscar
   @areasacomunes = Areacomun.new
   $tirajson=@areasacomunes.buscar()
   render :text => $tirajson  
  end
end

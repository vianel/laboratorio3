class AreascomunesController < ApplicationController
  def index
  end
  def grabar


  def grabar
   @datos = []
   @datos[0] = params[:nombre]
   @datos[1] = params[:descripcion]
   @datos[2] = params[:imagen1]
   @datos[3] = params[:capacidad]
   @datos[4] = params[:costo]
   @datos[5] = params[:brazalete]
   @datos[6] = 'A'
   @areascomunes = Areacomun.new
   valor = @areascomunes.grabar(@datos,params[:ufile])
   render :text => $tirajson
  end
  end

 

   def buscarpornombre
   @areascomunes = Areacomun.new
   nombre = params[:nombre]
   valor = @areascomunes.buscarpornombre(nombre)
   render :text => $tirajson
  end

   def buscar
   @areasacomunes = Areacomun.new
   $tirajson=@areasacomunes.buscar()
   render :text => $tirajson  
  end

end

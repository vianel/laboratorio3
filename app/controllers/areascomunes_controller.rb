class AreascomunesController < ApplicationController
  def index
  end



  def grabar
   @datos = []
   @datos[0] = params[:codigo]
   @datos[1] = params[:nombre]
   @datos[2] = params[:descripcion]
   @datos[3] = params[:imagen1]
   @datos[4] = params[:capacidad]
   @datos[5] = params[:costo]
   @datos[6] = params[:costoinvitado]
   @datos[7] = params[:horainicio]
   @datos[8] = params[:horafin]
   @datos[9] = 'A'
   @areascomunes = Areacomun.new
   valor = @areascomunes.grabar(@datos,params[:ufile])
   render :text => $tirajson

   
  end
  

 

   def buscarporcodigo
   @areascomunes = Areacomun.new
   codigo = params[:codigo]
   valor = @areascomunes.buscarporcodigo(codigo)
   render :text => $tirajson
  end

   def buscar
   @areasacomunes = Areacomun.new
   $tirajson=@areasacomunes.buscar()
   render :text => $tirajson  
  end

end

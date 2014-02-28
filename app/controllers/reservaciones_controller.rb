class ReservacionesController < ApplicationController

  def grabar
   @datos = []
   @datos[0] = params[:areacomun]
   @datos[1] = params[:codigo]
   @datos[2] = params[:fechauso]
   @datos[3] = params[:horainicio]
   @datos[4] = params[:horafin]
   @datos[5] = params[:nroinvitados]
   @datos[6] = params[:planilla1]
   @datos[7] = params[:observaciones]
   @datos[8] = 'A'
   @reservaciones = Reservacion.new
   valor = @reservaciones.grabar(@datos,params[:ufile1])
   
   render :text => $tirajson
  end
  def catalogo
   @reservaciones = Reservacion.new
   $tirajson=@reservaciones.catalogo()
   render :text => $tirajson  
  end


end
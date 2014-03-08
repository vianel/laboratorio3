class ReservacionesController < ApplicationController

  def grabar
 # capacidadmaxima = Areacomun.find_by_sql "SELECT capacidad_maxima from areas_comunes where id='#{params[:areacomun]}'"
 # puts ("capacidad: " + capacidadmaxima.to_s)
  @objareacomun = Areacomun.find_by(id:  params[:areacomun])
    
  if params[:nroinvitados].to_i <= @objareacomun.capacidad_maxima.to_i 
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
  else
      $tirajson = '{ "success": "true", "exito": "false","msg": "Capacidad de invitados Excedida" }'
  end
   render :text => $tirajson
  end
  def catalogo
   @reservaciones = Reservacion.new
   $tirajson=@reservaciones.catalogo()
   render :text => $tirajson  
  end


end
class ReservacionesController < ApplicationController

  def grabar

    @datos = []
    @datos[0] = params[:condominioid]
    @datos[1] = params[:areacomunid]
    @datos[2] = params[:fechareservacion]
    @datos[3] = params[:fechainicio]
    @datos[4] = params[:fechafinalizacion]
    @reservacion = reservacion.new
    valor = @reservacion.grabar(@datos)
    render :text => $tirajson

  end

end
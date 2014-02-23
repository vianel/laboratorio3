class RecibospagosController < ApplicationController
  def index
  end
   def grabar
   objingreso = Ingreso.find(:last)

   @datos = []
   @datos[0] = params[:tipodepago]
   @datos[1] = params[:banco]
   @datos[2] = params[:cuenta]
   @datos[3] = params[:voucher]
   @datos[4] = params[:monto]
   @datos[5] = params[:imagen1]
   @datos[6] = 'A'

   @recibospagos = Recibopago.new
   valor = @recibospagos.grabar(@datos,params[:ufile])
   render :text => $tirajson

   
  end
end

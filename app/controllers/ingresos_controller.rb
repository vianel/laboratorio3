class IngresosController < ApplicationController
  def index
  end

  def grabar
    @datos = []
    #@datos[0] = 1
    @datos[0] = $inmueble.id
    @datos[1] = params[:conceptoingreso]
    @datos[2] = params[:codigo]
    @datos[3] = params[:fecha]
    @datos[4] = params[:monto]
    @datos[5] = params[:abono]
    @datos[6] = params[:pagado]
    @datos[7] = 'A'
    @ingresos = Ingreso.new
    valor = @ingresos.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end
end

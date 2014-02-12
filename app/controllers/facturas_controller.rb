class FacturasController < ApplicationController
  def index
  end
  def grabar

    @datos = []
    #@datos[0] = 1
    @datos[0] = '1'
    @datos[1] = params[:subtotal]
    @datos[2] = params[:iva]
    @datos[3] = 'A'
    @factura = Factura.new
    valor = @factura.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end
   def buscar
   @facturas = Factura.new
   id = params[:id]
   valor = @facturas.buscar(id)
   render :text => $tirajson
  end
   def eliminar
   @facturas = Factura.new
   id = params[:id]
   valor = @facturas.eliminar(id)
   render :text => $tirajson
  end
end

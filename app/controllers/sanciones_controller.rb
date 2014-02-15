class SancionesController < ApplicationController
  def index
  end

  def grabarsancion

  	    @datos = []
    @datos[0] = params[:inmueble_id]
    @datos[1] = params[:tiposancion_id]
    @datos[2] = params[:descripcion]
    @datos[3] = params[:fecharealizacion]
    @datos[4] = params[:condicion]
    @datos[5] = params[:edosolvencia]
    @sancion = Sancion.new
    valor = @sancion.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end

     def catalogo
   @sanciones = Sancion.new
   $tirajson=@sanciones.catalogo()
   render :text => $tirajson  
  end

  def eliminar
   @sanciones = Sancion.new
   id = params[:id]
   valor = @sanciones.eliminar(id)
   render :text => $tirajson
  end
end

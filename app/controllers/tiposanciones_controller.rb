class TiposancionesController < ApplicationController
  def index
  end

  def grabartiposancion

  	    @datos = []
    @datos[0] = 1
    @datos[1] = params[:nombre]
    @datos[2] = params[:descripcion]
    @datos[3] = params[:monto]
    @datos[4] = params[:penalizacion]
    @tiposancion = Tiposancion.new
    valor = @tiposancion.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end 

  def modificar

  	    @datos = []
  	@datos[0] = params[:id]
    @datos[1] = 1
    @datos[2] = params[:nombre]
    @datos[3] = params[:descripcion]
    @datos[4] = params[:monto]
    @datos[5] = params[:penalizacion]
    @tiposancion = Tiposancion.new
    valor = @tiposancion.modificar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end 
  def buscar
      @tiposanciones = Tiposancion.new
   $tirajson=@tiposanciones.buscartodos()
   render :text => $tirajson  

  end

     def buscarporid
   @tiposanciones = Tiposancion.new
   id = params[:id]
   valor = @tiposanciones.buscarporid(id)
   render :text => $tirajson
  end

     def eliminar
   @tiposanciones = Tiposancion.new
   id = params[:id]
   valor = @tiposanciones.eliminar(id)
   render :text => $tirajson
  end
end

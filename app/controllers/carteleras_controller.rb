class CartelerasController < ApplicationController
  def index
  end

    def grabar
   @datos = []
   @datos[0] = params[:combotipopublicacion]
   @datos[1] = params[:combousuarioreceptor]
   @datos[2] = params[:codigocartelera]
   @datos[3] = params[:titulo]
   @datos[4] = params[:descripcion]
   @datos[5] = params[:fecha]
   @datos[6] = params[:imagen1]
   @datos[7] = 'A'
   @carteleras = Cartelera.new
   valor = @carteleras.grabar(@datos)
   render :text => $tirajson

   
  end

  def catalogopublicaciones
   @carteleras = Cartelera.new
   $tirajson=@carteleras.catalogo()
   render :text => $tirajson  
  end
end

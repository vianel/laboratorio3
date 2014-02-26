class NovedadesController < ApplicationController
  def index
  end

    def grabar
    @datos = []
    #@datos[0] = 1
    @datos[0] = params[:cedula]
    @datos[1] = params[:nombre]
    @datos[2] = params[:apellido]
    @datos[3] = params[:placavehiculo]
    @datos[4] = params[:descripcion]
    @datos[5] = params[:entrada]
    @datos[6] = params[:salida]
    @datos[7] = params[:inmueble]
    @datos[8] = params[:publicar]
    @datos[9] = 'A'
    @novedad = Novedad.new
    valor = @novedad.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end

     def catalogo
   @novedades = Novedad.new
   $tirajson=@novedades.catalogo()
   render :text => $tirajson  
  end
end

class TipoempleadosController < ApplicationController
  def index
  end
    def grabartipoempleado
    @datos = []
    @datos[0] = params[:nombre]
    @datos[1] = params[:descripcion]
    @datos[2] = params[:sueldobase]
    @datos[3] = params[:porcentajeprimahijos]
    @datos[4] = 'A'
    @tipoempleado = Tipoempleado.new
    valor = @tipoempleado.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end
    def buscar
      @tipoempleado = Tipoempleado.new
   $tirajson=@tipoempleado.buscar()
   render :text => $tirajson  

  end
end

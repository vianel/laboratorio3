class CondominiosController < ApplicationController
	def index
		Arbol.count
		#InterfazRol.count
	end
  def grabarcondominio

    @datos = []
    #@datos[0] = 1
    @datos[0] = params[:codigocondominio]
    @datos[1] = params[:nombrecondominio]
    @datos[2] = params[:direccioncondominio]
    @datos[3] = params[:rifcondominio]
    @datos[4] = params[:telefonocondominio]
    @datos[5] = params[:emailcondominio]
    @condominio = Modelocondominio.new
    valor = @condominio.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end
end

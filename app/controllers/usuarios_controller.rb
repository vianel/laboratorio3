class UsuariosController < ApplicationController
  def index

  end

    def grabarusuario

    roles = { "Administrador" => 1, "Propietario" => 2,"Root" => 3,"Empleado" => 4,"Junta" => 5}
    rol = roles[params[:rol]]
    puts rol
    @datos = []
    #@datos[0] = 1
    @datos[0] = rol
    @datos[1] = params[:login]
    @datos[2] = params[:password]
    @usuarios = Usuario.new
    valor = @usuarios.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson
    
  end

  def buscar
   @usuarios = Usuario.new
   $tirajson=@usuarios.buscar()
   render :text => $tirajson  
  end 
end

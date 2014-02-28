class AdministradoresController < ApplicationController
  def index
  end

  def grabaradmin
    edosciviles = { "Soltero" => 1, "Casado" => 2,"Divociado" => 3,"Viudo" => 4}
    edocivil = edosciviles[params[:edocivil]]
    puts edocivil
  	  	 $objusuarioparaelloginadmin = Usuario.find(:last) 
  	   @datos = []

   @datos[0] = params[:condominio]
   @datos[1] = params[:nombre]
   @datos[2] = params[:apellido]
   @datos[3] = params[:cedula]
   @datos[4] = params[:fechanacimiento]
   @datos[5] = params[:direccion]
   @datos[6] = params[:telefono]
   @datos[7] = params[:celular]
   @datos[8] = edocivil
   @datos[9] = params[:sueldo]
   @datos[10] = params[:fechacontrato]
   @datos[11] = params[:imagen1]
   @datos[12] = params[:correo]
   @administradores = Administrador.new
   valor = @administradores.grabaradmin(@datos,params[:ufile])
   render :text => $tirajson
  end
end

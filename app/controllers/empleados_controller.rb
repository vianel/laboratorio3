class EmpleadosController < ApplicationController
  def index
  end
   def catalogo
   @empleados = Empleado.new
   $tirajson=@empleados.catalogo()
   render :text => $tirajson  
  end
  def grabar
   @datos = []
   @datos[0] = params[:cedula]
   @datos[1] = params[:nombre]
   @datos[2] = params[:apellido]
   @datos[3] = params[:direccion]
   @datos[4] = params[:telefono]
   @datos[5] = params[:celular]
   @datos[6] = params[:correo]
   @datos[7] = params[:sexo]
   @datos[8] = params[:fechanacimiento]
   @datos[9] = params[:imagen1]
   @datos[10] = params[:edocivil]
   @datos[11] = params[:tipoempleado]
   @datos[12] = params[:nrohijos]
   @datos[13] = params[:cargo]
   @datos[14] = params[:fechaingreso]
   @datos[15] = params[:iniciojornada]
   @datos[16] = params[:finjornada]
   @datos[17] = 'A'
   @empleados = Empleado.new
   valor = @empleados.grabar(@datos,params[:ufile])
   render :text => $tirajson

   
  end
  
end

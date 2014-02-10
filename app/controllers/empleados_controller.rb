class EmpleadosController < ApplicationController
  def index
  end
   def catalogo
   @empleados = Empleado.new
   $tirajson=@empleados.catalogo()
   render :text => $tirajson  
  end
end

class Empleado < ActiveRecord::Base
	self.table_name = "empleados"


def catalogo()
   @objempleado = Empleado.all
   @son = Empleado.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objempleado.each do |empleado|
     if @i<@son
      tirajson = tirajson +   ' { "nombre": "'        + empleado.nombre +
                           
                              '", "apellido": "'   + empleado.apellido +
                              '", "direccion": "'        + empleado.direccion +
                              '", "telefono": "'        + empleado.telefono +
					          '", "email": "'      + empleado.email + '"}, '                              
     else
      tirajson = tirajson +   ' { "nombre": "'        + empleado.nombre +
                          
                              '", "apellido": "'   + empleado.apellido +
                              '", "direccion": "'        + empleado.direccion +
                              '", "telefono": "'        + empleado.telefono +
                              '", "email": "'      + empleado.email + '"} '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] }'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end


end

class Tipoempleado < ActiveRecord::Base
self.table_name = "tipos_empleados"
has_many = :empleado
   def grabar(datos)
     @objtipoempleado = Tipoempleado.new
   
   valor = 0
  #  @objtipoempleado = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objtipoempleado!=nil

      @objtipoempleado.codigo_tipo_empleado = 2 + rand(6) + rand(6)
      @objtipoempleado.condominio_id = $condominio.id
      @objtipoempleado.nombre = datos[0].to_s
      @objtipoempleado.descripcion = datos[1].to_s
      @objtipoempleado.sueldo_base = datos[2].to_f
      @objtipoempleado.prima_por_hijos = datos[3].to_i
      @objtipoempleado.status = datos[4].to_s
      @objtipoempleado.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end
   return valor
  end

    def buscar
  
     @objtipoempleado = Tipoempleado.all
   @son = Tipoempleado.count
   if @son > 0 
    @i=1
    tirajson = ' [ '
    @objtipoempleado.each do |tipoempleados|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + tipoempleados.id.to_s +
                              '", "codigo_tipo_empleado": "'        + tipoempleados.codigo_tipo_empleado.to_s+ 
                              '", "condominio_id": "'   + tipoempleados.condominio_id.to_s +
                            '", "nombre": "'      + tipoempleados.nombre.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + tipoempleados.id.to_s +
                              '", "codigo_tipo_empleado": "'        + tipoempleados.codigo_tipo_empleado.to_s + 
                              '", "condominio_id": "'   + tipoempleados.condominio_id.to_s+
                              '", "nombre": "'      + tipoempleados.nombre.to_s + '"} '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ]'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 



  end
end

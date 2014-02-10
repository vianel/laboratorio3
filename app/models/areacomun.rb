class Areacomun < ActiveRecord::Base
self.table_name = "AREASCOMUNES"
   def grabar(datos)
   valor = 0
  #  @objareacomun = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
   # if @objareacomun!=nil
      @objareacomun.ID = datos[0].to_s
      @objareacomun.CONDOMINIO_ID = datos[1].to_s
      @objareacomun.NOMBRE = datos[2].to_s
      @objareacomun.DESCRIPCION = datos[3].to_s
      @objareacomun.COSTO = datos[4].to_s
      @objareacomun.STATUS = datos[5].to_s
      
      @objareacomun.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      $tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      valor = 0
    #end 
   return valor
  end

  def buscar()
   @objareacomun = Areas_comunes.all
   @son = Areas_comunes.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objareacomun.each do |areas_comunes|
     if @i<@son
      tirajson = tirajson +   ' { "NOMBRE": "'        + areas_comunes.NOMBRE +
                              '", "DESCRIPCION": "'      + areas_comunes.DESCRIPCION + '"}, '                              
     else
      tirajson = tirajson +   ' { "NOMBRE": "'        + areas_comunes.NOMBRE +
                              '", "DESCRIPCION": "'      + areas_comunes.DESCRIPCION + '"} '    
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

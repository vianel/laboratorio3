class Areacomun < ActiveRecord::Base
self.table_name = "areas_comunes"
   def grabar(datos,upload)
     @objareacomun = Areacomun.new
   
   valor = 0
  #  @objareacomun = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
   # if @objareacomun!=nil
   #   @objareacomun.CONDOMINIO_ID = datos[0].to_i
      @objareacomun.nombre = datos[0].to_s
      @objareacomun.descripcion = datos[1].to_s
    

    #GUARDANDO LA IMAGEN
        tiraname1 = datos[2].to_s
        if tiraname1.include? "C%3A%5Cfakepath%5C"
         tiraname1 = tiraname1[18, tiraname1.length+1]
         @objareacomun.foto = tiraname1
        else
         @objareacomun.foto = tiraname1
        end
      mivariable = upload[0,23].to_s
        if mivariable.include? "jpeg"
        @objareacomun.foto  = Base64.decode64(upload[23, upload.length+1])
        else
           @objareacomun.foto  = Base64.decode64(upload[22, upload.length+1])
        end
       
    
      @objareacomun.capacidad = datos[3].to_i
      @objareacomun.costo = datos[4].to_f
      @objareacomun.precio_de_brazalete = datos[5].to_f
      @objareacomun.status = datos[6].to_s



      @objareacomun.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    #end 
   return valor
  end

  def buscar()
   @objareacomun = Areacomun.all
   @son = Areacomun.count
   if @son > 0 
    @i=1
    tirajson = ' [ '
    @objareacomun.each do |areas_comunes|
     if @i<@son
      tirajson = tirajson +   '   "'        + areas_comunes.nombre + '", '                              
     else
      tirajson = tirajson +   '   "'        + areas_comunes.nombre + '" '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] '
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end
end

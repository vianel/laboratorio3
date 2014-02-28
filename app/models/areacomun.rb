class Areacomun < ActiveRecord::Base
self.table_name = "areas_comunes"
   def grabar(datos,upload)
     @objareacomun = Areacomun.new
   
   valor = 0
  #  @objareacomun = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
   # if @objareacomun!=nil
   #   @objareacomun.CONDOMINIO_ID = datos[0].to_i
      @objareacomun.condominio_id = $condominio.id
      @objareacomun.codigo_area_comun = datos[0].to_s
      @objareacomun.nombre = datos[1].to_s
      @objareacomun.descripcion = datos[2].to_s

    #GUARDANDO LA IMAGEN
    tiraname1 = datos[3].to_s
    if tiraname1.include? "C%3A%5Cfakepath%5C"
     tiraname1 = tiraname1[18, tiraname1.length+1]
     @objareacomun.foto = tiraname1
    else
     @objareacomun.foto = tiraname1
    end
    headerfile = upload[0,23].to_s
    if headerfile.include? "jpeg"
     @objareacomun.formato1 = upload[0,23]
       @objareacomun.foto1  = Base64.decode64(upload[23, upload.length+1])
    else
     @objareacomun.formato1 = Base64.decode64(upload[0,22])
       @objareacomun.foto1  = Base64.decode64(upload[22, upload.length+1])
    end
      
      @objareacomun.capacidad_maxima = datos[4].to_i
      @objareacomun.costo = datos[5].to_f
      @objareacomun.costo_invitado = datos[6].to_f
      @objareacomun.hora_inicio = datos[7]
      @objareacomun.hora_fin = datos[8]
      @objareacomun.status = datos[9].to_s

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
    tirajson = '[  '
    @objareacomun.each do |areas_comunes|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + areas_comunes.id.to_s +
                              '", "condominio_id": "'        + areas_comunes.condominio_id.to_s+ 
                              '", "codigo": "'   + areas_comunes.codigo_area_comun.to_s +
                            '", "nombre": "'      + areas_comunes.nombre.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + areas_comunes.id.to_s +
                              '", "condominio_id": "'        + areas_comunes.condominio_id.to_s + 
                              '", "codigo": "'   + areas_comunes.codigo_area_comun.to_s+
                              '", "nombre": "'      + areas_comunes.nombre.to_s + '"} '     
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ]'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  



  end

  def buscarporcodigo(codigo)
        #'", "imagen": "'        + transportistas.imagen +
    #'", "imagen1": "'       + transportistas.formato11.to_s+Base64.strict_encode64(transportistas.imagen1)+
  
   valor = 0
    @objareacomun = Areacomun.find(:first, :conditions => "codigo='#{codigo}'" ) 
    if @objareacomun!=nil
       $tirajson = '{"success": "true", 
                    "exito": "true"  ,"nombre": "'        +@objareacomun.nombre+
                                   '", "descripcion": "'  +@objareacomun.descripcion+
                                  '", "imagen1": "'      +@objareacomun.formato1.to_s+Base64.strict_encode64(@objareacomun.foto1)+
                                  '", "capacidad": "'       +@objareacomun.capacidad_maxima.to_s +
                                   '", "costo": "'       +@objareacomun.costo.to_s+
                                   '", "costoinvitado": "'       +@objareacomun.costo_invitado.to_s+
                                   '", "horainicio": "'       +@objareacomun.hora_inicio.to_s+ 
                                 '", "horafin": "'     +@objareacomun.hora_fin.to_s+'"  }'
       valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "nombre no existe!" }'
      valor = 0
    end 
    return valor
  end
end

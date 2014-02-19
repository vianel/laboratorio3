class Tipopublicacion < ActiveRecord::Base
		self.table_name = "tipo_publicaciones"
    	has_many :publicaciones
   def grabar(datos)
     @objtipopublicacion = Tipopublicacion.new
   
   valor = 0
    if @objtipopublicacion!=nil

      @objtipopublicacion.codigo= datos[0].to_s
      @objtipopublicacion.inmueble_id = $inmueble.id
      @objtipopublicacion.nombre = datos[1].to_s
      @objtipopublicacion.descripcion = datos[2].to_s
      @objtipopublicacion.status = datos[3].to_s
      @objtipopublicacion.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1

    end 
   return valor
  end

  def buscar()
 
       @objtipopublicacion = Tipopublicacion.all
   @son = Tipopublicacion.count
   if @son > 0 
    @i=1
    tirajson = '[  '
    @objtipopublicacion.each do |tipopublicaciones|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + tipopublicaciones.id.to_s +
                              '", "codigo": "'   + tipopublicaciones.codigo.to_s +
                              '", "inmueble_id": "'        + tipopublicaciones.inmueble_id.to_s+ 
                            '", "nombre": "'      + tipopublicaciones.nombre.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + tipopublicaciones.id.to_s +
                                 '", "codigo": "'   + tipopublicaciones.codigo.to_s +
                              '", "inmueble_id": "'        + tipopublicaciones.inmueble_id.to_s+ 
                           '", "nombre": "'      + tipopublicaciones.nombre.to_s + '"} '     
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

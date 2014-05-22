class Cartelera < ActiveRecord::Base
	self.table_name = "carteleras"
   def grabar(datos)
     @objcartelera = Cartelera.new
   
   valor = 0
  #  @objcartelera = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
   # if @objcartelera!=nil
   #   @objcartelera.CONDOMINIO_ID = datos[0].to_i
      @objcartelera.tipo_publicaciones_id = datos[0].to_i
      @objcartelera.usuario_emisor_id= $usuario.id
      @objcartelera.usuario_receptor_id = datos[1].to_i
      @objcartelera.codigo_cartelera = datos[2].to_i
      @objcartelera.titulo = datos[3].to_s
      @objcartelera.descripcion = datos[4].to_s
      @objcartelera.fecha = datos[5]
=begin
    #GUARDANDO LA IMAGEN
        tiraname1 = datos[6].to_s
        if tiraname1.include? "C%3A%5Cfakepath%5C"
         tiraname1 = tiraname1[18, tiraname1.length+1]
         @objcartelera.archivo = tiraname1
        else
         @objcartelera.archivo = tiraname1
        end
        mivariable = upload[0,23].to_s
        if mivariable.include? "jpeg"
        @objcartelera.archivo  = Base64.decode64(upload[23, upload.length+1])
        else
           @objcartelera.archivo  = Base64.decode64(upload[22, upload.length+1])
        end
=end    
      @objcartelera.status = datos[7].to_s


      @objcartelera.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    #end 
   return valor
  end
end

class Inmueble < ActiveRecord::Base
	self.table_name = "inmuebles"
	belongs_to :propietario, nil, foreign_key: :propietario_id


   def grabar(datos)
     @objinmueble = Inmueble.new
   
   valor = 0
  #  @objinmueble = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objinmueble!=nil
   #   @objinmueble.CONDOMINIO_ID = datos[0].to_i
      @objinmueble.condominio_id = datos[0].to_i
      @objinmueble.propietario_id = datos[1].to_i
      @objinmueble.usuario_id = datos[2].to_i
      @objinmueble.alicuota = datos[3].to_f
      @objinmueble.numero_apartamento = datos[4].to_s
      @objinmueble.estado_solvencia = datos[5].to_s
      @objinmueble.status = datos[6].to_s
      
      @objinmueble.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end
end

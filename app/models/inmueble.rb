class Inmueble < ActiveRecord::Base
	self.table_name = "inmuebles"
	belongs_to :propietario, nil, foreign_key: :propietario_id
  belongs_to :modelocondominio


   def grabar(datos)
     @objinmueble = Inmueble.new
   
   valor = 0
  #  @objinmueble = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objinmueble!=nil
   #   @objinmueble.CONDOMINIO_ID = datos[0].to_i
      @objinmueble.condominio_id = datos[0].to_i
      @objinmueble.propietario_id = datos[1].to_i
      @objinmueble.usuario_id = datos[2].to_i
      @objinmueble.codigo_inmueble = datos[3].to_i
      @objinmueble.numero= datos[4].to_s
      @objinmueble.alicuota = datos[5].to_f
      @objinmueble.saldo_a_favor = datos[6].to_f
      @objinmueble.solvencia = datos[7].to_i
      @objinmueble.status = 'A'
      @objinmueble.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end

  def buscar
  
     @objinmueble = Inmueble.all
   @son = Inmueble.count
   if @son > 0 
    @i=1
    tirajson = ' [ '
    @objinmueble.each do |inmuebles|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + inmuebles.id.to_s +
                              '", "condominio_id": "'        + inmuebles.condominio_id.to_s+ 
                              '", "propietario_id": "'   + inmuebles.propietario_id.to_s +
                            '", "usuario_id": "'      + inmuebles.usuario_id.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + inmuebles.id.to_s +
                              '", "condominio_id": "'        + inmuebles.condominio_id.to_s + 
                              '", "propietario_id": "'   + inmuebles.propietario_id.to_s+
                              '", "usuario_id": "'      + inmuebles.usuario_id.to_s + '"} '    
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

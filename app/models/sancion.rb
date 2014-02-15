class Sancion < ActiveRecord::Base
	self.table_name = "sanciones"
	before_save :default_values
	belongs_to :tiposancion, nil, foreign_key: :tip_id

	def default_values
		self.status ||= 'A' # self.STATUS = self.STATUS || 'A'
	end

	def grabar(datos)
     @objsancion = Sancion.new
   
   valor = 0
  #  @objsancion = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objsancion!=nil
   #   @objsancion.CONDOMINIO_ID = datos[0].to_i
      @objsancion.inmueble_id = datos[0].to_i
      @objsancion.tip_id = datos[1].to_i
      @objsancion.descripcion = datos[2].to_s
      @objsancion.fecha_realizacion = datos[3]
      @objsancion.condicion = datos[4].to_s
	  @objsancion.estado_solvencia = datos[5].to_s      

      @objsancion.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end


   def eliminar(id)
   valor = 0
    @objsancion = Sancion.find(:first, :conditions => "id='#{id}'" )
    if @objsancion!=nil
      $tirajson = '{ "success": "true", "exito": "true", "msg": "Codigo Eliminado!" }'
      @objsancion.destroy
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Codigo no existe!" }'
      valor = 0
    end 
   return valor
  end


  def catalogo()
   @objsancion = Sancion.all

   @son = Sancion.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objsancion.each do |sanciones|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + sanciones.id.to_s +
                              '", "inmueble_id": "'        + sanciones.inmueble_id.to_s+ 
                              '", "tipo_id": "'   + sanciones.tiposancion.nombre.to_s +
                              '", "descripcion": "'   + sanciones.descripcion.to_s +
                              '", "fecha_realizacion": "'   + sanciones.fecha_realizacion.to_s +
                              '", "condicion": "'   + sanciones.condicion.to_s +
                              '", "estado_solvencia": "'   + sanciones.estado_solvencia.to_s +
                         	  '", "status": "'      + sanciones.status + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + sanciones.id.to_s +
                              '", "inmueble_id": "'        + sanciones.inmueble_id.to_s + 
                              '", "tipo_id": "'   + sanciones.tiposancion.nombre.to_s+
                              '", "descripcion": "'   + sanciones.descripcion.to_s +
                              '", "fecha_realizacion": "'   + sanciones.fecha_realizacion.to_s +
                              '", "condicion": "'   + sanciones.condicion.to_s +
                              '", "estado_solvencia": "'   + sanciones.estado_solvencia.to_s +
                           	  '", "status": "'      + sanciones.status + '"} '    
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

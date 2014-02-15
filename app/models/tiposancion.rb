class Tiposancion < ActiveRecord::Base
		self.table_name = "tipo_sanciones"
			before_save :default_values
      has_many :sancion

	def default_values
		self.status ||= 'A' # self.STATUS = self.STATUS || 'A'
	end
   def grabar(datos)
     @objtiposancion = Tiposancion.new
   
   valor = 0
  #  @objtiposancion = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objtiposancion!=nil
   #   @objtiposancion.CONDOMINIO_ID = datos[0].to_i
      @objtiposancion.condominio_id = datos[0].to_i
      @objtiposancion.nombre = datos[1].to_s
      @objtiposancion.descripcion = datos[2].to_s
      @objtiposancion.monto = datos[3].to_f
      @objtiposancion.penalizacion = datos[4].to_s
      

      @objtiposancion.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end

  	  def modificar(datos)
  	@objtiposancion = Tiposancion.find(:first, :conditions => "id='#{datos[0]}'" ) 

   valor = 0

      @objtiposancion.condominio_id = datos[1].to_i
      @objtiposancion.nombre = datos[2].to_s
      @objtiposancion.descripcion = datos[3].to_s
      @objtiposancion.monto = datos[4].to_f
      @objtiposancion.penalizacion = datos[5].to_s
       # @post.update(params[:post].permit(:title, :text))
      @objtiposancion.save
      $tirajson = '{ "success": "true", "msg": "Datos modificados satisfactoriamente!" }'
      valor = 1

  end
    def buscartodos
  
     @objtiposancion = Tiposancion.all
   @son = Tiposancion.count
   if @son > 0 
    @i=1
    tirajson = ' [ '
    @objtiposancion.each do |tiposanciones|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + tiposanciones.id.to_s +
                              '", "condominio_id": "'        + tiposanciones.condominio_id.to_s+ 
                              '", "nombre": "'   + tiposanciones.nombre.to_s +
                              '", "descripcion": "'   + tiposanciones.descripcion.to_s +
                              '", "monto": "'   + tiposanciones.monto.to_s +
                              '", "penalizacion": "'   + tiposanciones.penalizacion.to_s +
                            '", "status": "'      + tiposanciones.status.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + tiposanciones.id.to_s +
                              '", "condominio_id": "'        + tiposanciones.condominio_id.to_s + 
                              '", "nombre": "'   + tiposanciones.nombre.to_s+
                              '", "descripcion": "'   + tiposanciones.descripcion.to_s +
                              '", "monto": "'   + tiposanciones.monto.to_s +
                              '", "penalizacion": "'   + tiposanciones.penalizacion.to_s +
                              '", "status": "'      + tiposanciones.status.to_s + '"} '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ]'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 



  end

  def buscarporid(id)
       valor = 0
    @objtiposancion = Tiposancion.find(:first, :conditions => "id='#{id}'" ) 
    if @objtiposancion!=nil
       $tirajson = '{"success": "true", 
                    "exito": "true"  ,"id": "'          +@objtiposancion.id.to_s+
                              '", "condominio_id": "'        + @objtiposancion.condominio_id.to_s + 
                              '", "nombre": "'   + @objtiposancion.nombre.to_s+
                              '", "descripcion": "'   + @objtiposancion.descripcion.to_s +
                              '", "monto": "'   + @objtiposancion.monto.to_s +
                              '", "penalizacion": "'   + @objtiposancion.penalizacion.to_s +
                           '", "status": "'     +@objtiposancion.status.to_s+'"  }'
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Codigo no existe!" }'
      valor = 0
    end 
    return valor


  end

      def eliminar(id)
   valor = 0
    @objtiposancion = Tiposancion.find(:first, :conditions => "id='#{id}'" )
    if @objtiposancion!=nil
      $tirajson = '{ "success": "true", "exito": "true", "msg": "Codigo Eliminado!" }'
      @objtiposancion.destroy
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Codigo no existe!" }'
      valor = 0
    end 
   return valor
  end
end

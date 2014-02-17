class Modelocondominio < ActiveRecord::Base
	self.table_name = "condominios"
	before_save :default_values

	def default_values
		self.status ||= 'A' # self.STATUS = self.STATUS || 'A'
	end   

   def grabar(datos)
     @objcondominio = Modelocondominio.new
   
   valor = 0
  #  @objcondominio = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objcondominio!=nil
   #   @objcondominio.CONDOMINIO_ID = datos[0].to_i
      @objcondominio.codigo_condominio = datos[0].to_s
      @objcondominio.nombre = datos[1].to_s
      @objcondominio.direccion = datos[2].to_s
      @objcondominio.rif = datos[3].to_s
      @objcondominio.telefono = datos[4].to_s
      @objcondominio.email = datos[5].to_s
      
      @objcondominio.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end

  def buscar
  
     @objcondominio = Modelocondominio.all
   @son = Modelocondominio.count
   if @son > 0 
    @i=1
    tirajson = ' [ '
    @objcondominio.each do |condominios|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + condominios.id.to_s +
                              '", "codigocondominio": "'        + condominios.codigo_condominio.to_s+ 
                              '", "nombre": "'   + condominios.nombre.to_s +
                              '", "direccion": "'   + condominios.direccion.to_s +
                              '", "rif": "'   + condominios.rif.to_s +
                              '", "telefono": "'   + condominios.telefono.to_s +
                            '", "email": "'      + condominios.email.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + condominios.id.to_s +
                              '", "codigocondominio": "'        + condominios.codigo_condominio.to_s + 
                              '", "nombre": "'   + condominios.nombre.to_s+
                              '", "direccion": "'   + condominios.direccion.to_s +
                              '", "rif": "'   + condominios.rif.to_s +
                              '", "telefono": "'   + condominios.telefono.to_s +
                              '", "email": "'      + condominios.email.to_s + '"} '    
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

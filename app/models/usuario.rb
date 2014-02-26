class Usuario < ActiveRecord::Base
	self.table_name = "usuarios"
	validates :login, presence: true
	before_save :default_values

	def default_values
		self.status ||= 'A' # self.STATUS = self.STATUS || 'A'
	end
	
   def grabar(datos)

     @objusuario = Usuario.find(:first, :conditions => "login='#{datos[1].to_s}'" )
  
   valor = 0
  #  @objusuario = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objusuario==nil
      @objusuario = Usuario.new
   #   @objusuario.CONDOMINIO_ID = datos[0].to_i
      @objusuario.rol_id = datos[0].to_s
      @objusuario.login = datos[1].to_s
      @objusuario.password = datos[2].to_s
      
      @objusuario.save
      $tirajson = '{ "success": "true", "msg": "Usuario disponible proceda a llenar los datos" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    else
      $tirajson = '{ "success": "false", "msg": "Ese usuario ya existe" }'
    end 
   return valor
  end
  def buscar
  
  @objusuario = Usuario.all


   #@objusuario = Usuario.where(:rol_id => '2')
   @son = Usuario.count
   if @son > 0 
    @i=1
    tirajson = ' [ '
    @objusuario.each do |usuarios|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + usuarios.id.to_s +
                              '", "rol_id": "'        + usuarios.rol_id.to_s+ 
                              '", "login": "'   + usuarios.login.to_s +
                              '", "password": "'   + usuarios.password.to_s +
                            '", "status": "'      + usuarios.status.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + usuarios.id.to_s +
                              '", "rol_id": "'        + usuarios.rol_id.to_s + 
                              '", "login": "'   + usuarios.login.to_s+
                              '", "password": "'   + usuarios.password.to_s +
                              '", "status": "'      + usuarios.status.to_s + '"} '    
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

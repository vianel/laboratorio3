class Administrador < ActiveRecord::Base
	self.table_name="administradores"
	belongs_to :modelocondominio
	belongs_to :usuario
	

def grabaradmin(datos,upload)
     @objadministrador = Administrador.new
   
   valor = 0
  #  @objadministrador = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
   # if @objadministrador!=nil
   #   @objadministrador.CONDOMINIO_ID = datos[0].to_i
   	 # @objusuario = Usuario.find(:first, :conditions => "login='#{datos[0]}'" )
 
      @objadministrador.usuario_id = $objusuarioparaelloginadmin.id
      @objadministrador.condominio_id = datos[0].to_s
      @objadministrador.nombre= datos[1].to_s
      @objadministrador.apellido = datos[2].to_s
      @objadministrador.cedula = datos[3].to_s
      @objadministrador.fecha_nacimiento = datos[4]
      @objadministrador.direccion_alternativa = datos[5].to_s
      @objadministrador.telefono = datos[6]
	  @objadministrador.celular = datos[7]
=begin
    #GUARDANDO LA IMAGEN
        tiraname1 = datos[12].to_s
        if tiraname1.include? "C%3A%5Cfakepath%5C"
         tiraname1 = tiraname1[18, tiraname1.length+1]
         @objadministrador.foto = tiraname1
        else
         @objadministrador.foto = tiraname1
        end
        headerfile = upload[0,23].to_s
        if headerfile.include? "jpeg"
        @objadministrador.foto  = Base64.decode64(upload[23, upload.length+1])
        else
           @objadministrador.foto  = Base64.decode64(upload[22, upload.length+1])
        end
=end
    
      @objadministrador.estado_civil = datos[8]
      @objadministrador.sueldo = datos[9].to_f
      @objadministrador.fecha_contrato = datos[10]
      @objadministrador.status='A'



      @objadministrador.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    #end 
   return valor
end

end

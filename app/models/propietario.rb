class Propietario <  ActiveRecord::Base
	self.table_name = "propietarios"
	validates :cedula, presence: true
	validates :foto, presence: true
	validates :usuarios_id, presence: true
	#validates :STATUS, presence: true
	before_save :default_values
	has_many :inmuebles
	def default_values
		self.STATUS ||= 'A' # self.STATUS = self.STATUS || 'A'
	end

	def grabar(datos,upload)
	@objpropietario = Propietario.new


	@objpropietario.nombre = datos[0].to_s
	@objpropietario.apellido = datos[1].to_s
	@objpropietario.cedula = datos[2].to_s
	@objpropietario.fecha_nacimiento = datos[3].to_s
	@objpropietario.direccion_alternativa = datos[4].to_s
	@objpropietario.telefono = datos[5].to_s
	@objpropietario.celular = datos[6].to_s

    #GUARDANDO LA IMAGEN
        tiraname1 = datos[7].to_s
        if tiraname1.include? "C%3A%5Cfakepath%5C"
         tiraname1 = tiraname1[18, tiraname1.length+1]
         @objpropietario.foto = tiraname1
        else
         @objpropietario.foto = tiraname1
        end
        mivariable = upload[0,23].to_s
        if mivariable.include? "jpeg"
        @objpropietario.foto  = Base64.decode64(upload[23, upload.length+1])
        else
           @objpropietario.foto  = Base64.decode64(upload[22, upload.length+1])
        end
  @objpropietario.estado_civil = datos[8].to_s

	@objpropietario.save()

        $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1

   return valor

	end
   def buscar(cedula)

    @objpropietario = Propietario.find(:first, :conditions => "cedula='#{cedula}'" ) 
    if @objpropietario!=nil

     	valor = @objpropietario.id
    end 
    return valor
  end


      def catalogo()
   @objpropietario = Propietario.all
   @son = Propietario.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objpropietario.each do |propietarios|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + propietarios.id.to_s +
                              '", "nombre": "'   + propietarios.nombre.to_s +
                              '", "apellido": "'   + propietarios.apellido.to_s +
                              '", "cedula": "'        + propietarios.cedula.to_s+ 
                              '", "fecha_nacimiento": "'   + propietarios.fecha_nacimiento.to_s +
                              '", "direccion_alternativa": "'   + propietarios.direccion_alternativa.to_s +
                              '", "telefono": "'   + propietarios.telefono.to_s +
                              '", "celular": "'   + propietarios.celular.to_s +
                              '", "foto": "'   + propietarios.foto.to_s +
                              '", "estado_civil": "'   + propietarios.estado_civil.to_s +
                            '", "status": "'      + propietarios.status + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + propietarios.id.to_s +
                              '", "nombre": "'   + propietarios.nombre.to_s+
                              '", "apellido": "'   + propietarios.apellido.to_s+
                             '", "cedula": "'        + propietarios.cedula.to_s+ 
                              '", "fecha_nacimiento": "'   + propietarios.fecha_nacimiento.to_s +
                              '", "direccion_alternativa": "'   + propietarios.direccion_alternativa.to_s +
                              '", "telefono": "'   + propietarios.telefono.to_s +
                              '", "celular": "'   + propietarios.celular.to_s +
                              '", "foto": "'   + propietarios.foto.to_s +
                              '", "estado_civil": "'   + propietarios.estado_civil.to_s +
                            '", "status": "'      + propietarios.status + '"} '    
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
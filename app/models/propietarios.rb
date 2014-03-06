class Propietarios <  ActiveRecord::Base
	self.table_name = "propietarios"
	validates :cedula, presence: true
	#validates :STATUS, presence: true
	has_many :inmuebles


	def grabar(datos,upload)

	@objpropietario = Propietarios.new


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
    headerfile = upload[0,23].to_s
    if headerfile.include? "jpeg"
     @objpropietario.formato1 = upload[0,23]
       @objpropietario.foto1  = Base64.decode64(upload[23, upload.length+1])
    else
     @objpropietario.formato1 = Base64.decode64(upload[0,22])
       @objpropietario.foto1  = Base64.decode64(upload[22, upload.length+1])
    end
  @objpropietario.correo_electronico =datos[9].to_s
  @objpropietario.estado_civil = datos[8].to_s
  @objpropietario.status = 'A'
	@objpropietario.save()

        $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1

   return valor

	end
   def buscar(cedula)

    @objpropietario = Propietarios.find(:first, :conditions => "cedula='#{cedula}'" ) 
    if @objpropietario!=nil

     	valor = @objpropietario.id
    end 
    return valor
  end
       

  def catalogo
   edosciviles = { "1" => "Soltero", "2" => "Casado","3" => "Divociado","4" => "Viudo"}
   @objpropietario = Propietarios.all
   @son = Propietarios.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objpropietario.each do |propietarios|

    #inmueble = Inmueble.where(propietario_id: = propietarios.id)
    inmueble = Inmueble.find(:first, :conditions => {:propietario_id => propietarios.id})
    puts inmueble.numero
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + propietarios.id.to_s +
                              '", "nombre": "'   + propietarios.nombre.to_s +
                              '", "apellido": "'   + propietarios.apellido.to_s +
                              '", "cedula": "'        + propietarios.cedula.to_s+ 
                              '", "fecha_nacimiento": "'   + propietarios.fecha_nacimiento.to_s +
                              '", "direccion_alternativa": "'   + propietarios.direccion_alternativa.to_s +
                              '", "telefono": "'   + propietarios.telefono.to_s +
                              '", "celular": "'   + propietarios.celular.to_s +
                              '", "correo": "'   + propietarios.correo_electronico.to_s +
                              '", "foto": "'   + propietarios.foto +
                              '", "foto1": "'       + propietarios.formato1.to_s+Base64.strict_encode64(propietarios.foto1)+
                              '", "estado_civil": "'   + edosciviles[propietarios.estado_civil] +
                              '", "inmueble": "'      + inmueble.numero + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + propietarios.id.to_s +
                              '", "nombre": "'   + propietarios.nombre.to_s+
                              '", "apellido": "'   + propietarios.apellido.to_s+
                             '", "cedula": "'        + propietarios.cedula.to_s+ 
                              '", "fecha_nacimiento": "'   + propietarios.fecha_nacimiento.to_s +
                              '", "direccion_alternativa": "'   + propietarios.direccion_alternativa.to_s +
                              '", "telefono": "'   + propietarios.telefono.to_s +
                              '", "celular": "'   + propietarios.celular.to_s +
                              '", "correo": "'   + propietarios.correo_electronico.to_s +
                              '", "foto": "'   + propietarios.foto +
                              '", "foto1": "'       + propietarios.formato1.to_s+Base64.strict_encode64(propietarios.foto1)+
                              '", "estado_civil": "'   + edosciviles[propietarios.estado_civil] +
                              '", "inmueble": "'      + inmueble.numero + '"} '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] }'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end

  def eliminar(cedula)
   valor = 0

    @objpropietario = Propietarios.find(:first, :conditions => "cedula='#{cedula}'" )
    objinmueble = Inmueble.find(:first, :conditions => "propietario_id='#{@objpropietario.id}'")
    if objinmueble != nil
      $tirajson = '{ "success": "true", "exito": "false", "msg": "No puede eliminar el propietario hasta que elimine sus inmuebles" }'
      valor = 0
    else
      if @objpropietario!=nil
        $tirajson = '{ "success": "true", "exito": "true", "msg": "Propietario Eliminado" }'
        @objpropietario.destroy
        valor = 1
      else
        $tirajson = '{ "success": "true", "exito": "false", "msg": "Cedula no existe!" }'
        valor = 0
      end 
    end
   return valor
  end

end
class Novedad < ActiveRecord::Base
	self.table_name = "novedades"
   def grabar(datos)
     @objnovedad = Novedad.new
   
   valor = 0
  if @objnovedad!=nil
  	if datos[8].to_s == 'true'
  		bool = 'V'
  		publicarenlacartelera(datos[4].to_s)
  	else
  		bool = 'F'
  	end
      @objnovedad.codigo_novedades = 2 + rand(6) + rand(6)
      @objnovedad.inmueble_id = datos[7].to_i
      @objnovedad.cedula = datos[0].to_s
      @objnovedad.nombre = datos[1].to_s
      @objnovedad.apellido = datos[2].to_s
      @objnovedad.placa_vehiculo = datos[3].to_s
      @objnovedad.descripcion = datos[4].to_s
      @objnovedad.hora_entrada = datos[5]
      @objnovedad.hora_salida = datos[6]
      @objnovedad.empleado_id = $empleado.id
      @objnovedad.publicar_cartelera = bool
      @objnovedad.status = datos[9].to_s
      @objnovedad.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end

  def publicarenlacartelera(descripcion)
  	  
  	 Usuario.where(status: 'A').each do |idusuario| #Este ciclo hace q la publicacion le llegue a todos los usuarios 
  	  if idusuario.id != $usuario.id
  	  objcartelera = Cartelera.new
  	  objcartelera.tipo_publicaciones_id = '2'
      objcartelera.usuario_emisor_id= $usuario.id
      objcartelera.usuario_receptor_id = idusuario.id 
      objcartelera.codigo_cartelera = 2 + rand(6) + rand(6)
      objcartelera.titulo = 'Novedad'
      objcartelera.descripcion = descripcion
      objcartelera.fecha = Time.now.strftime("%Y/%m/%d %H:%M")
      objcartelera.status = 'A'
      objcartelera.save
  	end

  end

  end


   def catalogo
   @objnovedad = Novedad.all
   @son = Novedad.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objnovedad.each do |novedad|
    #empelado = Empleado.where(id: novedad.empleado_id)
    empleado = Empleado.find_by(id: novedad.empleado_id)
    puts empleado.cedula
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + novedad.id.to_s +
                              '", "codigo_novedades": "'   + novedad.codigo_novedades.to_s +
                              '", "inmueble_id": "'   + novedad.inmueble_id.to_s +
                              '", "cedula": "'        + novedad.cedula.to_s+ 
                              '", "nombre": "'   + novedad.nombre.to_s +
                              '", "apellido": "'   + novedad.apellido.to_s +
                              '", "placa_vehiculo": "'   + novedad.placa_vehiculo.to_s +
                              '", "descripcion": "'   + novedad.descripcion.to_s +
                              '", "hora_entrada": "'   + novedad.hora_entrada.to_s +
                              '", "hora_salida": "'   + novedad.hora_salida.to_s +
                            '", "empleado_id": "'      + empleado.cedula.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + novedad.id.to_s +
                              '", "codigo_novedades": "'   + novedad.codigo_novedades.to_s+
                              '", "inmueble_id": "'   + novedad.inmueble_id.to_s+
                             '", "cedula": "'        + novedad.cedula.to_s+ 
                              '", "nombre": "'   + novedad.nombre.to_s +
                              '", "apellido": "'   + novedad.apellido.to_s +
                              '", "placa_vehiculo": "'   + novedad.placa_vehiculo.to_s +
                              '", "descripcion": "'   + novedad.descripcion.to_s +
                              '", "hora_entrada": "'   + novedad.hora_entrada.to_s +
                              '", "hora_salida": "'   + novedad.hora_salida.to_s +
                            '", "empleado_id": "'      + empleado.cedula.to_s + '"} '    
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

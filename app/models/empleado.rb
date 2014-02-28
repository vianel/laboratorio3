class Empleado < ActiveRecord::Base
	self.table_name = "empleados"
  belongs_to :tipoempleado, nil, foreign_key: :tipo_empleado_id

def catalogo()
   @objempleado = Empleado.all
   @son = Empleado.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objempleado.each do |empleado|
     if @i<@son
      tirajson = tirajson +   ' { "nombre": "'        + empleado.nombre +
                           
                              '", "apellido": "'   + empleado.apellido +
                              '", "direccion": "'        + empleado.direccion +
                              '", "telefono": "'        + empleado.telefono +
					          '", "email": "'      + empleado.email + '"}, '                              
     else
      tirajson = tirajson +   ' { "nombre": "'        + empleado.nombre +
                          
                              '", "apellido": "'   + empleado.apellido +
                              '", "direccion": "'        + empleado.direccion +
                              '", "telefono": "'        + empleado.telefono +
                              '", "email": "'      + empleado.email + '"} '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] }'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end


   def grabar(datos,upload)
     @objempleado = Empleado.new
   
   valor = 0
  #  @objempleado = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
   # if @objempleado!=nil
      usuario = Usuario.find(:last)
      @objempleado.usuario_id= usuario.id 
      @objempleado.condominio_id = $condominio.id
      @objempleado.cedula = datos[0].to_s
      @objempleado.nombre = datos[1].to_s
      @objempleado.apellido = datos[2].to_s
      @objempleado.direccion_alternativa = datos[3].to_s
      @objempleado.telefono = datos[4].to_s
      @objempleado.celular = datos[5].to_s
      @objempleado.fecha_nacimiento = datos[8].to_s
      @objempleado.correo_electronico= datos[6].to_s

    #GUARDANDO LA IMAGEN
    tiraname1 = datos[9].to_s
    if tiraname1.include? "C%3A%5Cfakepath%5C"
     tiraname1 = tiraname1[18, tiraname1.length+1]
     @objempleado.foto = tiraname1
    else
     @objempleado.foto = tiraname1
    end
    headerfile = upload[0,23].to_s
    if headerfile.include? "jpeg"
     @objempleado.formato1 = upload[0,23]
       @objempleado.foto1  = Base64.decode64(upload[23, upload.length+1])
    else
     @objempleado.formato1 = Base64.decode64(upload[0,22])
       @objempleado.foto1  = Base64.decode64(upload[22, upload.length+1])
    end
      
      @objempleado.estado_civil = datos[10].to_i
      @objempleado.tipo_empleado_id = datos[11].to_i
      @objempleado.numero_hijos = datos[12].to_i
      @objempleado.inicio_jornada = datos[15]
      @objempleado.fin_jornada = datos[16]
      @objempleado.status = datos[17].to_s
      @objempleado.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    #end 
   return valor
  end

end

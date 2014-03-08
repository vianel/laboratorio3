class Reservacion < ActiveRecord::Base
  self.table_name = "reservaciones"
   belongs_to :ingreso, nil, foreign_key: :ingreso_id
def grabar(datos,upload1)
   valor = 0

   imagenpivot = nil
   @objreservacion = Reservacion.find(:first, :conditions => "fecha_uso='#{datos[2]}' and area_comun_id='#{datos[0].to_i}'" )
  

  if @objreservacion == nil
   @objreservacion = Reservacion.new
   @objreservacion.area_comun_id        = datos[0].to_i
    @objreservacion.fecha_reservacion = Time.now.strftime("%Y/%m/%d %H:%M")
    @objreservacion.codigo_reservaciones   = datos[1].to_s
    @objreservacion.inmueble_id = $inmueble.id
    @objreservacion.fecha_uso        = datos[2]
    @objreservacion.hora_inicio        = datos[3]
    @objreservacion.hora_fin        = datos[4]
    @objreservacion.numero_invitados        = datos[5].to_i

     tiraname2 = datos[6].to_s
        if tiraname2.include? "C%3A%5Cfakepath%5C"
         tiraname2 = tiraname2[18, tiraname2.length+1]
         @objreservacion.lista_invitados = tiraname2
        else
         @objreservacion.lista_invitados = tiraname2
        end
      #data:application/pdf;base64, 28
      @objreservacion.formato1 = upload1[0,28]
        @objreservacion.lista_invitados1 = Base64.decode64(upload1[28, upload1.length+1])  

    @objreservacion.observaciones        = datos[7].to_s
    @objreservacion.status        = datos[8].to_s

    @objreservacion.save 
    $tirajson = '{ "success": "true", "exito": "true", "msg": "Fecha reservada proceda a pagar" }'
    valor = 1
  else
      $tirajson = '{ "success": "true", "exito": "false","msg": "Fecha ocupada" }'
      valor = 0
  end
   return valor
  end
  
def catalogo
   @objreservacion = Reservacion.all
   @son = Reservacion.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objreservacion.each do |reservaciones|
    #empelado = Empleado.where(id: reservaciones.empleado_id)
    inmueble = Inmueble.find_by(id: reservaciones.inmueble_id)
    areacomun = Areacomun.find_by(id: reservaciones.area_comun_id)
    #puts empleado.cedula
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + reservaciones.id.to_s +
                              '", "codigo_reservaciones": "'   + reservaciones.codigo_reservaciones.to_s +
                              '", "ingreso_id": "'   + reservaciones.ingreso_id.to_s +
                              '", "area_comun_id": "'        + areacomun.nombre.to_s+ 
                              '", "fecha_reservacion": "'   + reservaciones.fecha_reservacion.to_s +
                              '", "inmueble_id": "'   + inmueble.numero.to_s +
                              '", "fecha_uso": "'   + reservaciones.fecha_uso.to_s +
                              '", "hora_inicio": "'   + reservaciones.hora_inicio.to_s +
                              '", "hora_fin": "'   + reservaciones.hora_fin.to_s +
                              '", "numero_invitados": "'   + reservaciones.numero_invitados.to_s +       
                              '", "lista_invitados1": "'    +reservaciones.formato1.to_s+Base64.strict_encode64(reservaciones.lista_invitados1)+
                              '", "lista_invitados": "'     +reservaciones.lista_invitados+'"  },'                             
     else
      tirajson = tirajson +   ' { "id": "'        + reservaciones.id.to_s +
                              '", "codigo_reservaciones": "'   + reservaciones.codigo_reservaciones.to_s+
                              '", "ingreso_id": "'   + reservaciones.ingreso_id.to_s+
                             '", "area_comun_id": "'        + areacomun.nombre.to_s+ 
                              '", "fecha_reservacion": "'   + reservaciones.fecha_reservacion.to_s +
                              '", "inmueble_id": "'   + inmueble.numero.to_s +
                              '", "fecha_uso": "'   + reservaciones.fecha_uso.to_s +
                              '", "hora_inicio": "'   + reservaciones.hora_inicio.to_s +
                              '", "hora_fin": "'   + reservaciones.hora_fin.to_s +
                              '", "numero_invitados": "'   + reservaciones.numero_invitados.to_s +    
                              '", "lista_invitados1": "'  +reservaciones.formato1.to_s+Base64.strict_encode64(reservaciones.lista_invitados1)+          
                              '", "lista_invitados": "'      + reservaciones.lista_invitados.to_s + '"} '    
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

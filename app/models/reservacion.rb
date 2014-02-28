class Reservacion < ActiveRecord::Base
  self.table_name = "reservaciones"
   belongs_to :ingreso, nil, foreign_key: :ingreso_id
def grabar(datos,upload1)
   valor = 0

   imagenpivot = nil
   @objingreso = Ingreso.find(:last)
  # @objreservacion = Reservacion.find(:first, :conditions => {:fecha_uso => datos[2]})
   @objreservacion = Reservacion.find(:first, :conditions => "fecha_uso='#{datos[2]}' and area_comun_id='#{datos[0].to_i}'" )

 if @objreservacion == nil
   @objreservacion = Reservacion.new

    @objreservacion.ingreso_id        = @objingreso.id
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

    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
    valor = 1
  else
    $tirajson = '{ "success": "true", "exito": "true", "message": "Esa fecha ya esta apartada" }'
    valor = 1
  end
   return valor
  end
  
  

end

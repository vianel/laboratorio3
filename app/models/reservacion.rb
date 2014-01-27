class Reservacion < ActiveRecord::Base
  self.table_name = "RESERVACIONES"

    def grabar(datos)
   valor = 0
   
      @objreservacion.inmuebleid = datos[0].to_s
      @objreservacion.areacomunid = datos[1].to_s
      @objreservacion.fechareservacion = datos[2].to_s
      @objreservacion.fechainicio = datos[3].to_s
      @objreservacion.fechafinalizacion = datos[4].to_s

      @objreservacion.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
 
#      $tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
 #     valor = 0
    
   return valor
  end

end

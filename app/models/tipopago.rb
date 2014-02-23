class Tipopago < ActiveRecord::Base
	self.table_name = "tipo_pagos"
    has_many :recibo_pagos
   def grabar(datos)
     @objtipopago = Tipopago.new
   
   valor = 0
    if @objtipopago!=nil

      @objtipopago.codigo_tipo_pago = datos[0].to_s
      @objtipopago.nombre = datos[1].to_s
      @objtipopago.status = datos[2].to_s
      
      @objtipopago.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1

    end 
   return valor
  end

    def buscar()
 
       @objtipopago = Tipopago.all
   @son = Tipopago.count
   if @son > 0 
    @i=1
    tirajson = '[  '
    @objtipopago.each do |conceptosingresos|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + conceptosingresos.id.to_s +
                              '", "nombre": "'        + conceptosingresos.nombre.to_s+ 
                              '", "codigo": "'   + conceptosingresos.codigo_tipo_pago.to_s +
                            '", "status": "'      + conceptosingresos.status.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + conceptosingresos.id.to_s +
                              '", "nombre": "'        + conceptosingresos.nombre.to_s + 
                              '", "codigo": "'   + conceptosingresos.codigo_tipo_pago.to_s+
                              '", "status": "'      + conceptosingresos.status.to_s + '"} '     
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

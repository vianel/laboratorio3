class Conceptoingreso < ActiveRecord::Base
		self.table_name = "concepto_ingresos"
    has_many :ingreso
   def grabar(datos)
     @objconceptoingreso = Conceptoingreso.new
   
   valor = 0
    if @objconceptoingreso!=nil

      @objconceptoingreso.codigo_concepto_ingreso = datos[0].to_s
      @objconceptoingreso.nombre = datos[1].to_s
      @objconceptoingreso.status = datos[2].to_s
      
      @objconceptoingreso.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1

    end 
   return valor
  end

    def buscar()
 
       @objconceptoingreso = Conceptoingreso.all
   @son = Conceptoingreso.count
   if @son > 0 
    @i=1
    tirajson = '[  '
    @objconceptoingreso.each do |conceptosingresos|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + conceptosingresos.id.to_s +
                              '", "nombre": "'        + conceptosingresos.nombre.to_s+ 
                              '", "codigo": "'   + conceptosingresos.codigo_concepto_ingreso.to_s +
                            '", "status": "'      + conceptosingresos.status.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + conceptosingresos.id.to_s +
                              '", "nombre": "'        + conceptosingresos.nombre.to_s + 
                              '", "codigo": "'   + conceptosingresos.codigo_concepto_ingreso.to_s+
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

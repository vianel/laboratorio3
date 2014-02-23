class Ingreso < ActiveRecord::Base
	self.table_name = "ingresos"
	belongs_to :inmueble, nil, foreign_key: :inmuebles_id
	belongs_to :conceptoingreso, nil, foreign_key: :conceptos_ingresos_id
  has_many :reservacion
   def grabar(datos)
     @objingreso = Ingreso.new
   
   valor = 0
  #  @objingreso = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objingreso!=nil
   #   @objingreso.CONDOMINIO_ID = datos[0].to_i
      @objingreso.inmuebles_id = datos[0].to_i
      @objingreso.concepto_ingresos_id = datos[1].to_i
      @objingreso.codigo_ingresos = datos[2].to_s
      @objingreso.fecha = datos[3]
      @objingreso.monto = datos[4].to_f
      @objingreso.abono = datos[5].to_f
      @objingreso.pagado = datos[6].to_i
      @objingreso.status = datos[7].to_s
      
      @objingreso.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente! ya puede reservar" }'
      valor = 1
      if datos[1].to_i == 3
        acumulador = datos[4].to_f + $inmueble.saldo_a_favor + datos[5].to_f
        puts acumulador

        acumulador =  acumulador - $inmueble.alicuota
        puts acumulador
        if acumulador >= 0 
            
              Inmueble.where("id" == $inmueble.id).update_all(:saldo_a_favor => acumulador , :solvencia => 1, :alicuota => 0) 
     
        else
              
              Inmueble.where("id" == $inmueble.id).update_all(:saldo_a_favor => 0, :solvencia => 0, :alicuota => acumulador*-1 )
     
        end

      end
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end


end
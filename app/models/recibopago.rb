class Recibopago < ActiveRecord::Base
	self.table_name = "recibos_pagos"
	belongs_to :tipopago, nil, foreign_key: :tipo_pago_id
   

   def grabar(datos,upload)
     @objrecibopago = Recibopago.new
   
   valor = 0
 
   	  @objingreso = Ingreso.find(:last)
      @objrecibopago.ingreso_id = @objingreso.id
      @objrecibopago.inmuebles_id = $inmueble.id
      @objrecibopago.codigo_recibo_pago = "0"
      @objrecibopago.tipo_pago_id = datos[0].to_i
      @objrecibopago.banco = datos[1].to_s
      @objrecibopago.cuenta = datos[2].to_s
      @objrecibopago.referencia_documento_mercantil = datos[3].to_s
      @objrecibopago.monto = datos[4].to_f
      @objrecibopago.status = datos[6].to_s
=begin
    #GUARDANDO LA IMAGEN
    tiraname1 = datos[4].to_s
    if tiraname1.include? "C%3A%5Cfakepath%5C"
     tiraname1 = tiraname1[18, tiraname1.length+1]
     @objrecibopago.foto = tiraname1
    else
     @objrecibopago.foto = tiraname1
    end
    headerfile = upload[0,23].to_s
    if headerfile.include? "jpeg"
     @objrecibopago.formato = upload[0,23]
       @objrecibopago.foto  = Base64.decode64(upload[23, upload.length+1])
    else
     @objrecibopago.formato = Base64.decode64(upload[0,22])
       @objrecibopago.foto  = Base64.decode64(upload[22, upload.length+1])
    end
=end


      @objrecibopago.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
      #ALGORITMO TRABAJANDO CON LA TABLA INGRESOS


      acumulado = $inmueble.saldo_a_favor + @objingreso.monto

      if @objingreso.monto >= $inmueble.alicuota
          abonado = @objingreso.monto - $inmueble.alicuota
          abonado += @objingreso.abono
          $inmueble.saldo_a_favor += abono 

      end
      puts acumulado
      if acumulado = 0
      $inmueble.saldo_a_favor=acumulado
      puts $inmueble.saldo_a_favor
      
      Inmueble.where("id" == $inmueble.id).update_all(:saldo_a_favor => $inmueble.saldo_a_favor , :solvencia => 1 )
        
      elsif $inmueble.alicuota > acumulado
          $inmueble.saldo_a_favor = $inmueble.alicuota - acumulado
      puts $inmueble.saldo_a_favor
          Inmueble.where("id" == $inmueble.id).update_all(:saldo_a_favor => $inmueble.saldo_a_favor*-1 , :solvencia => 0 )
      else
            $inmueble.saldo_a_favor = $inmueble.alicuota - acumulado     
            Inmueble.where("id" == $inmueble.id).update_all(:saldo_a_favor => $inmueble.saldo_a_favor , :solvencia => 1) 
      end
   return valor
  end


end

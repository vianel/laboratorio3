class Factura < ActiveRecord::Base
	self.table_name = "facturas"
   def grabar(datos)
     @objfactura = Factura.new
   
   valor = 0
  #  @objfactura = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
   # if @objfactura!=nil
   #   @objfactura.CONDOMINIO_ID = datos[0].to_i
      @objfactura.condominio_id = datos[0].to_i
      @objfactura.sub_total = datos[1].to_f
      @objfactura.iva = datos[2].to_f
      @objfactura.status = datos[3].to_s
      
      @objfactura.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    #end 
   return valor
  end


    def buscar(id)
   valor = 0
    @objfactura = Factura.find(:first, :conditions => "id='#{id}'" ) 
    if @objfactura!=nil
       $tirajson = '{"success": "true", 
                    "exito": "true"  ,"id": "'        	+@objfactura.id.to_s+
                                   '", "subtotal": "'      +@objfactura.sub_total.to_s+
                           '", "iva": "'     +@objfactura.iva.to_s+'"  }'
     	valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Codigo no existe!" }'
      valor = 0
    end 
    return valor
  end

    def eliminar(id)
   valor = 0
    @objfactura = Factura.find(:first, :conditions => "id='#{id}'" )
    if @objfactura!=nil
      $tirajson = '{ "success": "true", "exito": "true", "msg": "Codigo Eliminado!" }'
      @objfactura.destroy
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Codigo no existe!" }'
      valor = 0
    end 
   return valor
  end
end

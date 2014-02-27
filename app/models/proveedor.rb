class Proveedor < ActiveRecord::Base
  self.table_name = "proveedores"
   def grabar(datos)
     @objproveedor = Proveedor.new
   
   valor = 0
  #  @objproveedor = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objproveedor!=nil
   #   @objproveedor.CONDOMINIO_ID = datos[0].to_i
      @objproveedor.rif = datos[0].to_s
      @objproveedor.nombre = datos[1].to_s
      @objproveedor.direccion = datos[2].to_s
      @objproveedor.codigo_proveedor = 2 + rand(6) + rand(6)
      @objproveedor.telefono = datos[3].to_s
      @objproveedor.email = datos[4].to_s
      @objproveedor.celular = datos[5].to_s
      @objproveedor.status = datos[6].to_s
      @objproveedor.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end
end

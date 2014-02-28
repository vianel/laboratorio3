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

  def catalogo
   @objproveedor = Proveedor.all
   @son = Proveedor.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objproveedor.each do |proveedores|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + proveedores.id.to_s +
                              '", "rif": "'   + proveedores.rif.to_s +
                              '", "nombre": "'   + proveedores.nombre.to_s +
                              '", "direccion": "'   + proveedores.direccion.to_s +
                             '", "telefono": "'   + proveedores.telefono.to_s +
                              '", "email": "'   + proveedores.email.to_s +
                            '", "celular": "'      + proveedores.celular.to_s + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + proveedores.id.to_s +
                              '", "rif": "'   + proveedores.rif.to_s+
                              '", "nombre": "'   + proveedores.nombre.to_s+
                              '", "direccion": "'   + proveedores.direccion.to_s +
                              '", "telefono": "'   + proveedores.telefono.to_s +
                              '", "email": "'   + proveedores.email.to_s +
                            '", "celular": "'      + proveedores.celular.to_s + '"} '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] }'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end

      def eliminar(rif)
   valor = 0
    @objproveedor = Proveedor.find(:first, :conditions => "rif='#{rif}'" )
    if @objproveedor!=nil
      $tirajson = '{ "success": "true", "exito": "true", "msg": "Codigo Eliminado!" }'
      @objproveedor.destroy
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Codigo no existe!" }'
      valor = 0
    end 
   return valor
  end
end

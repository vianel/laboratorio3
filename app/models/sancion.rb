class Sancion < ActiveRecord::Base
	self.table_name = "sanciones"
	before_save :default_values
	belongs_to :tiposancion, nil, foreign_key: :tip_id

	def default_values
		self.status ||= 'A' # self.STATUS = self.STATUS || 'A'
	end

	def grabar(datos)
     @objsancion = Sancion.new
   
   valor = 0
  #  @objsancion = Areacomun.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objsancion!=nil
   #   @objsancion.CONDOMINIO_ID = datos[0].to_i
      @objsancion.inmueble_id = datos[0].to_i
      @objsancion.tip_id = datos[1].to_i
      @objsancion.descripcion = datos[2].to_s
      @objsancion.fecha_realizacion = datos[3]
      @objsancion.condicion = datos[4].to_s
	  @objsancion.estado_solvencia = datos[5].to_s      

      @objsancion.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    #else
      #$tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      #valor = 0
    end 
   return valor
  end
end

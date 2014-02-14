class Propietario <  ActiveRecord::Base
	self.table_name = "propietarios"
	validates :cedula, presence: true
	validates :foto, presence: true
	validates :usuarios_id, presence: true
	#validates :STATUS, presence: true
	before_save :default_values
	has_many :inmuebles
	def default_values
		self.STATUS ||= 'A' # self.STATUS = self.STATUS || 'A'
	end

	def grabar
	@objpropietario = Propietario.new
	@objpropietario.nombre = datos[0].to_s
	@objpropietario.apellido = datos[1].to_s
	@objpropietario.direccion = datos[7].to_s
	@objpropietario.telefono = datos[2].to_s
	@objpropietario.correo = datos[3].to_s
	@objpropietario.sexo = datos[4].to_s
	@objpropietario.fecha_nacimiento = datos[5].to_s
	@objpropietario.estadocivil = datos[6].to_s


	@objpropietario.save()

	end
   def buscar(cedula)

    @objpropietario = Propietario.find(:first, :conditions => "cedula='#{cedula}'" ) 
    if @objpropietario!=nil

     	valor = @objpropietario.id
    end 
    return valor
  end


      def catalogo()
   @objpropietario = Propietario.all
   @son = Propietario.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objpropietario.each do |propietarios|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + propietarios.id.to_s +
                              '", "cedula": "'        + propietarios.cedula.to_s+ 
                              '", "nombre": "'   + propietarios.nombre.to_s +
                              '", "apellido": "'   + propietarios.apellido.to_s +
                              '", "direccion_alternativa": "'   + propietarios.direccion_alternativa.to_s +
                              '", "telefono": "'   + propietarios.telefono.to_s +
                              '", "celular": "'   + propietarios.celular.to_s +
                              '", "email": "'   + propietarios.email.to_s +
                              '", "sexo": "'   + propietarios.sexo.to_s +
                              '", "fecha_nacimiento": "'   + propietarios.fecha_nacimiento.to_s +
                              '", "foto": "'   + propietarios.foto.to_s +
                              '", "estado_civil": "'   + propietarios.estado_civil.to_s +
                              '", "condominio_id": "'   + propietarios.condominio_id.to_s +
                         	  '", "status": "'      + propietarios.status + '"}, '                              
     else
      tirajson = tirajson +   ' { "id": "'        + propietarios.id.to_s +
                              '", "cedula": "'        + propietarios.cedula.to_s + 
                              '", "nombre": "'   + propietarios.nombre.to_s+
                              '", "apellido": "'   + propietarios.apellido.to_s+
                              '", "direccion_alternativa": "'   + propietarios.direccion_alternativa.to_s+
                              '", "telefono": "'   + propietarios.telefono.to_s+
                              '", "celular": "'   + propietarios.celular.to_s+
                              '", "email": "'   + propietarios.email.to_s+
                              '", "sexo": "'   + propietarios.sexo.to_s+
                              '", "fecha_nacimiento": "'   + propietarios.fecha_nacimiento.to_s+
                              '", "foto": "'   + propietarios.foto.to_s+
                              '", "estado_civil": "'   + propietarios.estado_civil.to_s+
                              '", "condominio_id": "'   + propietarios.condominio_id.to_s +
                           	  '", "status": "'      + propietarios.status + '"} '    
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] }'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end

end
class Propietario <  ActiveRecord::Base
	self.table_name = "PROPIETARIOS"
	validates :CEDULA, presence: true
	validates :FOTO, presence: true
	validates :USUARIOS_ID, presence: true
	#validates :STATUS, presence: true
	before_save :default_values
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


end
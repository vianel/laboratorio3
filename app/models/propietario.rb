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
end
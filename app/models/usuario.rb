class Usuario < ActiveRecord::Base
	self.table_name = "USUARIOS"
	validates :nombre_usuario, presence: true

end

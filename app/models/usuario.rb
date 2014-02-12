class Usuario < ActiveRecord::Base
	self.table_name = "usuarios"
	validates :nombre_usuario, presence: true

end

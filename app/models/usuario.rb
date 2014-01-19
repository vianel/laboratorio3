class Usuario < ActiveRecord::Base
  self.table_name = "Usuario"
  after_initialize :relleno_usuario
  validates :nombre_usuario, presence: true

  def relleno_usuario
  	self.estatus = 'A'
  	if self.codigo_usuario.nil?
  		self.codigo_usuario = Usuario.count + 1
  	end
  end

end

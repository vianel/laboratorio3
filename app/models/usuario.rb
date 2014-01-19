class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  self.table_name = "Usuario"
  after_initialize :relleno_usuario
  validates :nombre_usuario, presence: true
  def email_required?
	  false
	end

	def email_changed?
	  false
	end
  def relleno_usuario
  	self.estatus = 'A'
  	Usuario.count
  	if self.codigo_usuario.nil?
  		self.codigo_usuario = Usuario.count + 1
  	end
  end

end

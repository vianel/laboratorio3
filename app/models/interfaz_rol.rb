class InterfazRol < ActiveRecord::Base
	self.table_name = "INTERFACES_POR_ROLES"
	belongs_to :interfaz, nil, foreign_key: :INTERFACES_ID
end
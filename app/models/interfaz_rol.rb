class InterfazRol < ActiveRecord::Base
	self.table_name = "interfaces_por_roles"
	belongs_to :interfaz, nil, foreign_key: :interfaces_id
end
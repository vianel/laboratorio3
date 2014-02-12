class Interfaz < ActiveRecord::Base
	self.table_name = "interfaces"
	has_many :interfaz_rols
end
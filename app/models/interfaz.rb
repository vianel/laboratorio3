class Interfaz < ActiveRecord::Base
	self.table_name = "INTERFACES"
	has_many :interfaz_rols
end
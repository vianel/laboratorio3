class CondominioController < ApplicationController
	def index
		Interfaz.count
		InterfazRol.count
	end
end

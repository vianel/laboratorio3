class SesionesController < ApplicationController
	def entrar
		$usuario = Usuario.find_by(LOGIN: params[:login], PASSWORD: params[:password])
		render json: { exito: !$usuario.nil? }
	end
end
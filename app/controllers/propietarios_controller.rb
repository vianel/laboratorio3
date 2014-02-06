class PropietariosController < ApplicationController
	before_action :set_propietario, only: [:update, :destroy]#:show, :edit]
	respond_to :json

	def index
		respond_with Propietario.all
	end

	def create
		@propietario = Propietario.new(propietario_params)
		respond_to do |format|
			if @propietario.save
				format.json { render json: @propietario }
			else
				format.json { render json: @propietario.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		if @propietario.update(propietario_params)
			respond_with nil
		else
			respond_with @propietario.errors
		end
	end

	def destroy
		@propietario.destroy
		respond_with 'El propietario fue borrado con éxito'
	end

	private

	def set_propietario
		@propietario = Propietario.find(params[:id])
    end

    def propietario_params
    	params.require(:propietario).permit(:ID, :NOMBRE, :APELLIDO, :DIRECCION_ALTERNATIVA,
    		:TELEFONO, :CELULAR, :EMAIL, :SEXO, :FECHA_NACIMIENTO, :ESTADO_CIVIL, :CEDULA,
    		:FOTO, :CONDOMINIO_ID, :USUARIOS_ID, :CARGO_JUNTA_ONDOMINIO_ID)
    end
end
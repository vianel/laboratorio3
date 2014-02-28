class ProveedoresController < ApplicationController
  def index
  end

   def grabar
    @datos = []
    #@datos[0] = 1
    @datos[0] = params[:rif]
    @datos[1] = params[:nombre]
    @datos[2] = params[:direccion]
    @datos[3] = params[:telefono]
    @datos[4] = params[:email]
    @datos[5] = params[:celular]
    @datos[6] = 'A'
    @proveedor = Proveedor.new
    valor = @proveedor.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    render :text => $tirajson

  end
     def catalogo
   @proveedores = Proveedor.new
   $tirajson=@proveedores.catalogo()
   render :text => $tirajson  
  end

     def eliminar
   @proveedores = Proveedor.new
   rif = params[:rif]
   valor = @proveedores.eliminar(rif)
   render :text => $tirajson
  end
end

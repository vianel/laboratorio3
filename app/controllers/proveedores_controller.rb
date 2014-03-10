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

  def obtenerEmpresa
    curl = CURL.new
    contenido = curl.get("http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=10&rif="+ params[:rif])
    j=ActiveSupport::JSON
      #convertir como arreglo
    exito = j.decode(contenido).to_a[0] 
    if exito.to_a[1].to_s=="1"
    @rif = j.decode(contenido).to_a[1][1].to_s
    @nombre = j.decode(contenido).to_a[2][1].to_s
    @direccion = j.decode(contenido).to_a[3][1].to_s
    @telefono = j.decode(contenido).to_a[4][1].to_s
    @correo = j.decode(contenido).to_a[5][1].to_s
      #imprimimos por consola para probar
    puts("rif: "+@rif)
    puts("nombre: "+@nombre)
    puts("correo: "+@correo)

   
    $tirajson = '{"success": "true", 
                    "exito": "true"  ,"rif": "'          +@rif+
                                   '", "nombre": "'      +@nombre+
                                    '", "direccion": "'      +@direccion+
                                    '", "telefono": "'      +@telefono+
                                    '", "correo": "'     +@correo+'"  }'
    else 
    $tirajson = '{ "success": "true", "msg": "La empresa no Existe en el SENIAT" }'
    end
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

class HidrolaraController < ApplicationController
  def index
  end

  def catalogofacturaspendientes
    curl = CURL.new
    contenido = curl.get("http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=14&rif="+ $condominio.rif.to_s)
    j=ActiveSupport::JSON
      #convertir como arreglo
    exito = j.decode(contenido).to_a[0] 
    if exito.to_a[1].to_s=="1"
    @numerocontrato = j.decode(contenido).to_a[1][1].to_s
    @rif = j.decode(contenido).to_a[2][1].to_s
    @titular = j.decode(contenido).to_a[3][1].to_s

      #imprimimos por consola para probar
    puts("numerocontrato: "+@numerocontrato)
    puts("rif: "+@rif)
    puts("titular: "+@titular)

   
      $tirajson = contenido
    else 
    $tirajson = '{ "success": "true", "msg": "No tiene facturas pendientes" }'
    end
    render :text => $tirajson 
   
  end
    def catalogofacturaspagadas
    curl = CURL.new
    contenido = curl.get("http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=13&rif="+ $condominio.rif.to_s)
    j=ActiveSupport::JSON
      #convertir como arreglo
    exito = j.decode(contenido).to_a[0] 
    if exito.to_a[1].to_s=="1"
    @numerocontrato = j.decode(contenido).to_a[1][1].to_s
    @rif = j.decode(contenido).to_a[2][1].to_s
    @titular = j.decode(contenido).to_a[3][1].to_s

      #imprimimos por consola para probar
    puts("numerocontrato: "+@numerocontrato)
    puts("rif: "+@rif)
    puts("titular: "+@titular)

   
      $tirajson = contenido
    else 
    $tirajson = '{ "success": "true", "msg": "error" }'
    end
    render :text => $tirajson 
   
  end
end

class IngresosController < ApplicationController
  def index
  end

  def grabar
    @valor = 1
    @datos = []
    if params[:formadepago] == "En linea"
      pagoenlinea(params[:nrocuenta],params[:monto])
    else
      @pagado = 0
      $tirajson = '{"success": "true"'
    end
    if (@valor == 1)
    #@datos[0] = 1
    @datos[0] = $inmueble.id
    @datos[1] = params[:conceptoingreso]
    @datos[2] = params[:codigo]
    @datos[3] = params[:fecha]
    @datos[4] = params[:monto]
    @datos[5] = params[:abono]
    @datos[6] = @pagado
    @datos[7] = 'A'
    @ingresos = Ingreso.new
    valor = @ingresos.grabar(@datos)
    #$tirajson = '{"success": "true", "msg":"Prueba"}'
    end
    render :text => $tirajson

  end

  def pagoenlinea(nrocuenta,monto)
    curl = CURL.new
    contenido = curl.get("http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=6&nroCuenta=" +nrocuenta.to_s+"&cod_inmueble="+$inmueble.id.to_s+"&monto="+monto.to_s+"&rifCondominio="+$condominio.rif.to_s)
    j=ActiveSupport::JSON
      #convertir como arreglo
    exito = j.decode(contenido).to_a[0] 
    if exito.to_a[1].to_s=="1"
    @observacion = j.decode(contenido).to_a[1][1].to_s
    @numerodecuenta = j.decode(contenido).to_a[2][1].to_s
     #imprimimos por consola para probar
    puts("observacion: "+@observacion)
    puts("numerodecuenta: "+@numerodecuenta)
   
    $tirajson = '{"success": "true", 
                    "exito": "true"  ,"observacion": "'          +@observacion+
                             '", "numerodecuenta": "'     +@numerodecuenta+'" '

   @valor = 1
   @pagado = 1
    else
      @valor =0
      $tirajson ='{ "success": "true", "msg": "'+ j.decode(contenido).to_a[1][1].to_s + '" } ' 
    end

  end

  def catalogo
   @ingresos = Ingreso.new
   $tirajson=@ingresos.catalogo()
   render :text => $tirajson  
  end
end

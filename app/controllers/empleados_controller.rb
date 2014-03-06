class EmpleadosController < ApplicationController
  def index
  end
   def catalogo
   @empleados = Empleado.new
   $tirajson=@empleados.catalogo()
   render :text => $tirajson  
  end
  def grabar
        edosciviles = { "Soltero" => 1, "Casado" => 2,"Divociado" => 3,"Viudo" => 4}
    edocivil = edosciviles[params[:edocivil]]
    puts edocivil
   @datos = []
   @datos[0] = params[:cedula]
   @datos[1] = params[:nombre]
   @datos[2] = params[:apellido]
   @datos[3] = params[:direccion]
   @datos[4] = params[:telefono]
   @datos[5] = params[:celular]
   @datos[6] = params[:correo]
   @datos[7] = params[:sexo]
   @datos[8] = params[:fechanacimiento]
   @datos[9] = params[:imagen1]
   @datos[10] = edocivil
   @datos[11] = params[:tipoempleado]
   @datos[12] = params[:nrohijos]
   @datos[15] = params[:iniciojornada]
   @datos[16] = params[:finjornada]
   @datos[17] = 'A'
   @empleados = Empleado.new
   valor = @empleados.grabar(@datos,params[:ufile])
   render :text => $tirajson

   
  end
    def obtenerempleado
    curl = CURL.new
    contenido = curl.get("http://192.168.2.21:81/ServiciosEAI/RESTful-RUBY/servicio/Broker.php?servicioSolicitado=1&cedRifPersona="+ params[:cedula])
    j=ActiveSupport::JSON
      #convertir como arreglo
    exito = j.decode(contenido).to_a[0] 
    if exito.to_a[1].to_s=="1"
    @cedula = j.decode(contenido).to_a[1][1].to_s
    @nombre = j.decode(contenido).to_a[2][1].to_s
    @apellido = j.decode(contenido).to_a[3][1].to_s
    @fechaNacimiento = j.decode(contenido).to_a[4][1].to_s
    @sexo = j.decode(contenido).to_a[5][1].to_s
    @estadoCivil = j.decode(contenido).to_a[6][1].to_s
    @direccion = j.decode(contenido).to_a[7][1].to_s
    @telefono = j.decode(contenido).to_a[8][1].to_s
    @correo = j.decode(contenido).to_a[9][1].to_s
      #imprimimos por consola para probar
    puts("cedula: "+@cedula)
    puts("nombre: "+@nombre)
    puts("estadoCivil: "+@estadoCivil)

     edosciviles = { 'S' => "Soltero", "C" => "Casado","D" => "Divociado","V" => "Viudo"}

   
    $tirajson = '{"success": "true", 
                    "exito": "true"  ,"cedula": "'          +@cedula+
                                   '", "nombre": "'      +@nombre+
                                    '", "apellido": "'      +@apellido+
                                    '", "telefono": "'      +@telefono+
                                     '", "fechanacimiento": "'      +@fechaNacimiento+
                                     '", "direccion": "'      +@direccion+
                                     '", "estadocivil": "'      +edosciviles[@estadoCivil].to_s+
                           '", "correo": "'     +@correo+'"  }'
    else 
    $tirajson = '{ "success": "true", "msg": "La persona no Existe en el SAIME" }'
    end
    render :text => $tirajson 
   
  end
  
end

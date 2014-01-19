# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Actividad", primary_key: "codigo_actividad", force: true do |t|
    t.string "codigo_usuario",   limit: 4,  null: false
    t.string "nombre_actividad", limit: 50, null: false
    t.date   "fecha",                       null: false
    t.string "estatus",          limit: 1,  null: false
  end

  create_table "Actividad_rol", primary_key: "codigo_actividad_rol", force: true do |t|
    t.string "codigo_rol", limit: 4, null: false
    t.string "estatus",    limit: 1, null: false
  end

  create_table "Area_comun", primary_key: "codigo_area", force: true do |t|
    t.string "descripcion", limit: 50, null: false
    t.float  "costo",                  null: false
    t.string "estatus",     limit: 1,  null: false
  end

  create_table "Banco", primary_key: "codigo_banco", force: true do |t|
    t.string "rif_banco",    limit: 12,  null: false
    t.string "nombre_banco", limit: 50,  null: false
    t.string "direccion",    limit: 200, null: false
    t.string "telefono",     limit: 15,  null: false
    t.string "estatus",      limit: 1,   null: false
  end

  create_table "Caja_chica", primary_key: "codigo_caja_chica", force: true do |t|
    t.float  "monto",             null: false
    t.string "estatus", limit: 1, null: false
  end

  create_table "Concepto", primary_key: "codigo_concepto", force: true do |t|
    t.string "descripcion", limit: 200, null: false
    t.string "estatus",     limit: 1,   null: false
  end

  create_table "Concepto_nomina", primary_key: "codigo_concepto", force: true do |t|
    t.string "codigo_empleado", limit: 4, null: false
    t.string "codigo_nomina",   limit: 4, null: false
    t.string "estatus",         limit: 1, null: false
  end

  create_table "Condominio", primary_key: "codigo_condominio", force: true do |t|
    t.string "rif_condominio", limit: 20,  null: false
    t.string "nombre",         limit: 50,  null: false
    t.string "direccion",      limit: 200, null: false
    t.string "estatus",        limit: 1,   null: false
  end

  create_table "Configuracion_condominio", primary_key: "codigo_configuracion_condominio", force: true do |t|
    t.string "codigo_condominio", limit: 4, null: false
    t.string "codigo_actividad",  limit: 4, null: false
    t.string "estatus",           limit: 1, null: false
  end

  create_table "Cotizacion", primary_key: "codigo_cotizacion", force: true do |t|
    t.string  "codigo_proveedor", limit: 4, null: false
    t.string  "codigo_insumo",    limit: 4, null: false
    t.date    "fecha",                      null: false
    t.integer "cantidad_insumo",            null: false
    t.float   "precio_unitario",            null: false
    t.float   "monto_total",                null: false
    t.string  "estatus",          limit: 1, null: false
  end

  create_table "Cuenta_bancaria", primary_key: "codigo_cuenta_bancaria", force: true do |t|
    t.string  "codigo_banco",  limit: 4,  null: false
    t.integer "numero_cuenta",            null: false
    t.string  "tipo_cuenta",   limit: 50, null: false
    t.string  "estatus",       limit: 1,  null: false
  end

  create_table "Cuota_mensual", primary_key: "codigo_cuota", force: true do |t|
    t.string "codigo_inmueble", limit: 4, null: false
    t.date   "fecha",                     null: false
    t.float  "monto_total",               null: false
    t.string "estatus",         limit: 1, null: false
  end

  create_table "Egreso", primary_key: "codigo_egreso", force: true do |t|
    t.string "codigo_tipo_egreso", limit: 4,  null: false
    t.string "descripcion",        limit: 50, null: false
    t.date   "fecha_egreso",                  null: false
    t.float  "monto_egreso",                  null: false
    t.string "estatus",            limit: 1,  null: false
  end

  create_table "Egreso_cuota", primary_key: "codigo_egreso_cuota", force: true do |t|
    t.string "codigo_inmueble",       limit: 4, null: false
    t.float  "monto_egreso_inmueble",           null: false
    t.date   "fecha",                           null: false
    t.string "estatus",               limit: 1, null: false
  end

  create_table "Empleado", primary_key: "codigo_empleado", force: true do |t|
    t.string  "codigo_tipo_empleado",   limit: 4,   null: false
    t.string  "cedula",                 limit: 8,   null: false
    t.string  "nombre",                 limit: 50,  null: false
    t.string  "apellido",               limit: 50,  null: false
    t.string  "direccion",              limit: 100, null: false
    t.date    "fecha_nacimiento",                   null: false
    t.string  "sexo",                   limit: 10,  null: false
    t.string  "telefono",               limit: 15,  null: false
    t.string  "correo_electronico",     limit: 50,  null: false
    t.string  "estado_civil",           limit: 10,  null: false
    t.integer "numero_hijos",                       null: false
    t.date    "fecha_ingreso",                      null: false
    t.float   "sueldo_base",                        null: false
    t.string  "numero_cuenta_bancaria", limit: 20,  null: false
    t.string  "estatus",                limit: 1,   null: false
  end

  create_table "Estacionamiento", primary_key: "codigo_estacionamiento", force: true do |t|
    t.string "codigo_propietario", limit: 4, null: false
    t.string "estatus",            limit: 1, null: false
  end

  create_table "Falla", primary_key: "codigo_falla", force: true do |t|
    t.string "codig_propietario", limit: 4,  null: false
    t.string "descripcion",       limit: 50, null: false
    t.string "estatus falla",     limit: 10, null: false
    t.string "estatus",           limit: 1,  null: false
  end

  create_table "Faltante", primary_key: "codigo_faltante", force: true do |t|
    t.string  "codigo_insumo",   limit: 4, null: false
    t.integer "cantidad_insumo",           null: false
    t.date    "fecha",                     null: false
    t.string  "estatus",         limit: 1, null: false
  end

  create_table "Ingreso", primary_key: "codigo_ingreso", force: true do |t|
    t.string "codigo_tipo_ingreso", limit: 4,  null: false
    t.string "descripcion",         limit: 50, null: false
    t.date   "fecha_ingreso",                  null: false
    t.float  "monto",                          null: false
    t.string "estatus",             limit: 1,  null: false
  end

  create_table "Inmueble", primary_key: "codigo_inmueble", force: true do |t|
    t.string "codigo_propietario", limit: 4, null: false
    t.float  "alicuota",                     null: false
    t.string "estatus",            limit: 1, null: false
  end

  create_table "Insumo", primary_key: "codigo_insumo", force: true do |t|
    t.string  "nombre",          limit: 50, null: false
    t.integer "cantidad_insumo",            null: false
    t.string  "estatus",         limit: 1,  null: false
  end

  create_table "Inventario", primary_key: "codigo_inventario", force: true do |t|
    t.string  "descripcion",  limit: 20, null: false
    t.integer "cantidad",                null: false
    t.integer "stock minimo",            null: false
    t.integer "stock maximo",            null: false
    t.string  "estatus",      limit: 1,  null: false
  end

  create_table "Junta_condominio", primary_key: "codigo_junta_condominio", force: true do |t|
    t.string "codigo_propietario", limit: 4,  null: false
    t.string "cargo",              limit: 50, null: false
    t.string "estatus",            limit: 1,  null: false
  end

  create_table "Nomina", primary_key: "codigo_nomina", force: true do |t|
    t.string "codigo_empleado",      limit: 4, null: false
    t.date   "fecha_apertura",                 null: false
    t.date   "fecha_cierre",                   null: false
    t.float  "monto_deducciones",              null: false
    t.float  "monto_remuneraciones",           null: false
    t.float  "total_nomina",                   null: false
    t.string "estatus",              limit: 1, null: false
  end

  create_table "Pago", primary_key: "codigo_pago", force: true do |t|
    t.string  "codigo_propietario", limit: 4,  null: false
    t.string  "descripcion",        limit: 50, null: false
    t.string  "codigo_transaccion", limit: 4,  null: false
    t.date    "fecha",                         null: false
    t.integer "estatus",                       null: false
  end

  create_table "Propietario", primary_key: "codigo_propietario", force: true do |t|
    t.string "cedula",           limit: 20, null: false
    t.string "nombre",           limit: 50, null: false
    t.string "apellido",         limit: 50, null: false
    t.date   "fecha_nacimiento",            null: false
    t.string "sexo",             limit: 10, null: false
    t.string "telefono",         limit: 15, null: false
    t.string "estatus",          limit: 1,  null: false
  end

  create_table "Propietario_inmueble", id: false, force: true do |t|
    t.string "codigo_propietario_inmueble", limit: 4, null: false
    t.string "codigo_inmueble",             limit: 4, null: false
    t.string "estatus",                     limit: 1, null: false
  end

  create_table "Proveedor", primary_key: "codigo_proveedor", force: true do |t|
    t.string "rif_empresa",      limit: 12, null: false
    t.string "nombre_proveedor", limit: 50, null: false
    t.string "nombre_empresa",   limit: 50, null: false
    t.string "descripcion",      limit: 80, null: false
    t.string "telefono",         limit: 15, null: false
    t.string "estatus",          limit: 1,  null: false
  end

  create_table "Queja_sugerencia", primary_key: "codigo_queja_sugerencia", force: true do |t|
    t.string "codigo_propietario", limit: 4,   null: false
    t.string "descripcion",        limit: 100, null: false
    t.string "estatus",            limit: 1,   null: false
  end

  create_table "Recibo", primary_key: "codigo_recibo", force: true do |t|
    t.string "codigo_propietario",  limit: 4, null: false
    t.string "codigo_egreso_cuota", limit: 4, null: false
    t.string "codigo_cuota",        limit: 4, null: false
    t.string "estatus",             limit: 1, null: false
  end

  create_table "Requisicion", primary_key: "codigo_requisicion", force: true do |t|
    t.string  "codigo_insumo", limit: 4, null: false
    t.date    "fecha",                   null: false
    t.integer "cantidad",                null: false
    t.string  "estatus",       limit: 1, null: false
  end

  create_table "Reservacion", primary_key: "codigo_reserva", force: true do |t|
    t.string  "codigo_propietario", limit: 4,  null: false
    t.string  "codigo_area",        limit: 4,  null: false
    t.string  "tipo_reserva",       limit: 80, null: false
    t.date    "fecha_reserva",                 null: false
    t.date    "fecha_uso",                     null: false
    t.integer "estatus",                       null: false
  end

  create_table "Rol", primary_key: "codigo_rol", force: true do |t|
    t.string "descripcion", limit: 30, null: false
    t.string "estatus",     limit: 1,  null: false
  end

  create_table "Sancion", primary_key: "codigo_sancion", force: true do |t|
    t.string "codigo_propietario",  limit: 4,   null: false
    t.string "codigo_tipo_sancion", limit: 4,   null: false
    t.string "descripcion",         limit: 100, null: false
    t.float  "monto_sancion",                   null: false
    t.string "estatus",             limit: 1,   null: false
  end

  create_table "Tipo_egreso", primary_key: "codigo_tipo_egreso", force: true do |t|
    t.string "descripcion", limit: 4, null: false
    t.string "estatus",     limit: 1, null: false
  end

  create_table "Tipo_empleado", primary_key: "codigo_tipo_empleado", force: true do |t|
    t.string "descripcion", limit: 50, null: false
    t.string "estatus",     limit: 1,  null: false
  end

  create_table "Tipo_ingreso", primary_key: "codigo_tipo_ingreso", force: true do |t|
    t.string "descripcion", limit: 100, null: false
    t.string "estatus",     limit: 1,   null: false
  end

  create_table "Tipo_pago", primary_key: "codigo_tipo_pago", force: true do |t|
    t.string "descripcion", limit: 50, null: false
    t.string "estatus",     limit: 1,  null: false
  end

  create_table "Tipo_sancion", primary_key: "codigo_tipo_sancion", force: true do |t|
    t.string "descripcion", limit: 50, null: false
    t.string "estatus",     limit: 1,  null: false
  end

  create_table "Usuario", primary_key: "codigo_usuario", force: true do |t|
    t.string "nombre_usuario", limit: 50, null: false
    t.string "contraseña",     limit: 20, null: false
    t.string "estatus",        limit: 1,  null: false
  end

  create_table "Usuario_rol", primary_key: "codigo_usuario_rol", force: true do |t|
    t.string "codigo_rol", limit: 4, null: false
    t.string "estatus",    limit: 1, null: false
  end

  create_table "Visita", primary_key: "codigo_visita", force: true do |t|
    t.string "codigo_inmueble", limit: 4,  null: false
    t.string "cedula",          limit: 10, null: false
    t.string "nombre",          limit: 50, null: false
    t.string "apellido",        limit: 50, null: false
    t.date   "fecha",                      null: false
    t.time   "hora_llegada",               null: false
    t.time   "hora_salida",                null: false
    t.string "estatus",         limit: 1,  null: false
  end

end

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

  create_table "ADMINISTRADORES", primary_key: "ID", force: true do |t|
    t.string  "CEDULA",                limit: 10,         null: false
    t.binary  "FOTO",                  limit: 2147483647, null: false
    t.integer "USUARIO_ID",                               null: false
    t.integer "RIF_CONDOMINIO"
    t.string  "NOMBRE",                limit: 60,         null: false
    t.string  "APELLIDO",              limit: 60,         null: false
    t.string  "DIRECCION_ALTERNATIVA",                    null: false
    t.string  "TELEFONO",              limit: 12
    t.string  "CELULAR",               limit: 12,         null: false
    t.string  "EMAIL",                 limit: 20,         null: false
    t.string  "SEXO",                  limit: 1
    t.date    "FECHA_NACIMIENTO"
    t.string  "ESTADO_CIVIL",          limit: 1
    t.date    "FECHA_INGRESO",                            null: false
    t.date    "FECHA_CULMINACION",                        null: false
    t.float   "SUELDO",                                   null: false
    t.string  "OBSERVACION"
    t.string  "STATUS",                limit: 1,          null: false
  end

  add_index "ADMINISTRADORES", ["RIF_CONDOMINIO"], name: "FK_RELATIONSHIP_92", using: :btree
  add_index "ADMINISTRADORES", ["USUARIO_ID"], name: "FK_RELATIONSHIP_88", using: :btree

  create_table "AGENDAS", primary_key: "ID", force: true do |t|
    t.integer "JUNTA_CONDOMINIO_ID"
    t.string  "DESCRIPCION",                    null: false
    t.date    "FECHA",                          null: false
    t.time    "HORA",                           null: false
    t.string  "LUGAR",               limit: 60, null: false
    t.string  "STATUS",              limit: 1,  null: false
  end

  add_index "AGENDAS", ["JUNTA_CONDOMINIO_ID"], name: "FK_RELATIONSHIP_76", using: :btree

  create_table "AREAS_COMUNES", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60, null: false
    t.string  "DESCRIPCION"
    t.float   "COSTO",                    null: false
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "AREAS_COMUNES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_20", using: :btree

  create_table "ASAMBLEAS_DE_JUNTAS_DE_CONDOMINIOS", primary_key: "ID", force: true do |t|
    t.date   "FECHA",                    null: false
    t.string "PUNTOS_TRATAR", limit: 60, null: false
    t.string "LUGAR",         limit: 60
    t.string "ACUERDOS",                 null: false
    t.string "STATUS",        limit: 1,  null: false
  end

  create_table "BANCOS_EMPRESAS", primary_key: "ID", force: true do |t|
    t.string "NOMBRE", limit: 60
    t.string "STATUS", limit: 1,  null: false
  end

  create_table "CARACERISTICAS_TIPOS_INMUEBLES", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60, null: false
    t.string  "DESCRIPCION"
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "CARACERISTICAS_TIPOS_INMUEBLES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_50", using: :btree

  create_table "CARACTERISTICAS_POR_TIPOS_INMUEBLES", id: false, force: true do |t|
    t.integer "ID",                          null: false
    t.integer "CARACTERISTICA_ID",           null: false
    t.string  "STATUS",            limit: 1, null: false
  end

  add_index "CARACTERISTICAS_POR_TIPOS_INMUEBLES", ["CARACTERISTICA_ID"], name: "FK_RELATIONSHIP_4", using: :btree

  create_table "CARGOS_JUNTAS_CONDOMINIOS", primary_key: "ID", force: true do |t|
    t.string "NOMBRE",      limit: 60, null: false
    t.string "DESCRIPCION"
    t.string "STATUS",      limit: 1,  null: false
  end

  create_table "CARGOS_POR_JUNTAS_DE_CONDOMINIOS", primary_key: "ID", force: true do |t|
    t.integer "JUNTA_CONDOMINIO_ID",           null: false
    t.integer "CARGO_ID",                      null: false
    t.integer "USUARIO_ID"
    t.string  "STATUS",              limit: 1, null: false
  end

  add_index "CARGOS_POR_JUNTAS_DE_CONDOMINIOS", ["CARGO_ID"], name: "FK_RELATIONSHIP_77", using: :btree
  add_index "CARGOS_POR_JUNTAS_DE_CONDOMINIOS", ["JUNTA_CONDOMINIO_ID"], name: "FK_RELATIONSHIP_78", using: :btree
  add_index "CARGOS_POR_JUNTAS_DE_CONDOMINIOS", ["USUARIO_ID"], name: "FK_RELATIONSHIP_90", using: :btree

  create_table "CARTELERAS", primary_key: "ID", force: true do |t|
    t.string "DESCRIPCION",                        null: false
    t.date   "FECHA",                              null: false
    t.string "USUARIOS_ID",     limit: 10,         null: false
    t.string "TIPO_USUARIO_ID", limit: 10,         null: false
    t.binary "FOTO",            limit: 2147483647, null: false
    t.string "STATUS",          limit: 1
  end

  create_table "COMPROBANTES_PAGOS_LICENCIAS", primary_key: "ID", force: true do |t|
    t.integer "LICENCIA_ID"
    t.integer "RENOVACIONES_ID"
    t.integer "BANCO_ID"
    t.string  "CI_RIF_DEPOSITANTE", limit: 12,         null: false
    t.string  "NOMBRE_DEPOSITANTE", limit: 60
    t.string  "NUMERO_DEPOSITO",    limit: 80,         null: false
    t.date    "FECHA_DEPOSITO",                        null: false
    t.binary  "FOTO_COMPROBANTE",   limit: 2147483647, null: false
    t.string  "STATUS",             limit: 1,          null: false
  end

  add_index "COMPROBANTES_PAGOS_LICENCIAS", ["BANCO_ID"], name: "FK_RELATIONSHIP_85", using: :btree
  add_index "COMPROBANTES_PAGOS_LICENCIAS", ["LICENCIA_ID"], name: "FK_RELATIONSHIP_83", using: :btree
  add_index "COMPROBANTES_PAGOS_LICENCIAS", ["RENOVACIONES_ID"], name: "FK_RELATIONSHIP_84", using: :btree

  create_table "CONDOMINIOS", primary_key: "ID", force: true do |t|
    t.string "RIF_CONDOMINIO", limit: 20
    t.string "NOMBRE",         limit: 60, null: false
    t.string "DIRECCION",                 null: false
    t.string "TELEFONO",       limit: 12
    t.string "CELULAR",        limit: 12
    t.string "EMAIL",          limit: 20, null: false
    t.string "STATUS",         limit: 1,  null: false
  end

  create_table "COTIZACIONES", primary_key: "ID", force: true do |t|
    t.string "PRODUCTO_ID", limit: 20
    t.date   "FECHA",                  null: false
    t.string "STATUS",      limit: 1,  null: false
  end

  add_index "COTIZACIONES", ["PRODUCTO_ID"], name: "FK_RELATIONSHIP_32", using: :btree

  create_table "DETALLES_EGRESOS", id: false, force: true do |t|
    t.integer "PRODUCTOS_ID",           null: false
    t.integer "FACTURA_ID",             null: false
    t.float   "CANTIDAD"
    t.string  "STATUS",       limit: 1, null: false
  end

  add_index "DETALLES_EGRESOS", ["FACTURA_ID"], name: "FK_RELATIONSHIP_68", using: :btree

  create_table "DETALLES_FACTURAS", id: false, force: true do |t|
    t.integer "FACTURA_ID",                     null: false
    t.integer "SERVICIOS_COMUNES_ID",           null: false
    t.float   "CANTIDAD"
    t.string  "STATUS",               limit: 1, null: false
  end

  add_index "DETALLES_FACTURAS", ["FACTURA_ID"], name: "FK_RELATIONSHIP_57", using: :btree

  create_table "EGRESOS", primary_key: "ID", force: true do |t|
    t.integer "FACTURA_EGRESO_ID"
    t.integer "CONDOMINIO_ID"
    t.string  "DESCRIPCION"
    t.string  "STATUS",            limit: 1, null: false
  end

  add_index "EGRESOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_70", using: :btree
  add_index "EGRESOS", ["FACTURA_EGRESO_ID"], name: "FK_RELATIONSHIP_67", using: :btree

  create_table "EMPLEADOS", primary_key: "ID", force: true do |t|
    t.string  "NOMBRE",                limit: 60
    t.string  "APELLIDO",              limit: 60
    t.string  "DIRECCION_ALTERNATIVA"
    t.string  "TELEFONO",              limit: 12
    t.string  "CELULAR",               limit: 12
    t.string  "EMAIL",                 limit: 20
    t.string  "SEXO",                  limit: 1
    t.date    "FECHA_NACIMIENTO"
    t.string  "ESTADO_CIVIL",          limit: 1
    t.string  "CEDULA",                limit: 10,         null: false
    t.binary  "FOTO",                  limit: 2147483647, null: false
    t.string  "EMPLEADO_ID",           limit: 10
    t.integer "TIPO_EMPLEADO_ID"
    t.string  "CARGO",                 limit: 60
    t.date    "FECHA_INGRESO",                            null: false
    t.integer "NUMERO_HIJOS"
    t.time    "INICIO_JORNADA"
    t.time    "FIN_JORNADA"
    t.string  "STATUS",                limit: 1,          null: false
  end

  add_index "EMPLEADOS", ["TIPO_EMPLEADO_ID"], name: "FK_RELATIONSHIP_2", using: :btree

  create_table "ESTACIONAMIENTOS", primary_key: "ID", force: true do |t|
    t.integer "INMUEBLE_ID"
    t.integer "CONDOMINIO_ID"
    t.string  "NUMERO",        limit: 4, null: false
    t.string  "DESCRIPCION"
    t.string  "STATUS",        limit: 1, null: false
  end

  add_index "ESTACIONAMIENTOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_14", using: :btree
  add_index "ESTACIONAMIENTOS", ["INMUEBLE_ID"], name: "FK_RELATIONSHIP_13", using: :btree

  create_table "FACTURAS", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.float   "SUB_TOTAL"
    t.float   "IVA"
    t.string  "STATUS",        limit: 1, null: false
  end

  add_index "FACTURAS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_56", using: :btree

  create_table "FACTURAS_EGRESOS", primary_key: "ID", force: true do |t|
    t.integer "INVENTARIO_ID"
    t.float   "SUB_TOTAL"
    t.float   "IVA"
    t.string  "STATUS",        limit: 1, null: false
  end

  add_index "FACTURAS_EGRESOS", ["INVENTARIO_ID"], name: "FK_RELATIONSHIP_66", using: :btree

  create_table "GASTOS_EXTRAS", primary_key: "ID", force: true do |t|
    t.integer "TIPO_GASTOS_ID"
    t.integer "INMUEBLE_ID"
    t.string  "DESCRIPCION"
    t.date    "FECHA"
    t.float   "COSTO"
    t.string  "STATUS",         limit: 1, null: false
  end

  add_index "GASTOS_EXTRAS", ["INMUEBLE_ID"], name: "FK_RELATIONSHIP_71", using: :btree
  add_index "GASTOS_EXTRAS", ["TIPO_GASTOS_ID"], name: "FK_RELATIONSHIP_72", using: :btree

  create_table "INGRESOS", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.integer "RECIBO_RESERVACION_ID"
    t.integer "RECIBO_SANCION_ID"
    t.string  "DESCRIPCION"
    t.string  "STATUS",                limit: 1, null: false
  end

  add_index "INGRESOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_65", using: :btree
  add_index "INGRESOS", ["RECIBO_RESERVACION_ID"], name: "FK_RELATIONSHIP_95", using: :btree
  add_index "INGRESOS", ["RECIBO_SANCION_ID"], name: "FK_RELATIONSHIP_98", using: :btree

  create_table "INMUEBLES", primary_key: "ID", force: true do |t|
    t.float   "ALICUOTA",                     null: false
    t.string  "NUMERO_APARTAMENTO", limit: 4
    t.integer "CONDOMINIO_ID"
    t.integer "PROPIETARIO_ID"
    t.string  "STATUS",             limit: 1, null: false
  end

  add_index "INMUEBLES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_9", using: :btree
  add_index "INMUEBLES", ["PROPIETARIO_ID"], name: "FK_RELATIONSHIP_48", using: :btree

  create_table "INTERFACES", primary_key: "ID", force: true do |t|
    t.string "NOMBRE",      limit: 60, null: false
    t.string "DESCRIPCION"
    t.string "STATUS",      limit: 1,  null: false
  end

  create_table "INTERFACES_POR_ROLES", id: false, force: true do |t|
    t.integer "ID",                       null: false
    t.integer "INTERFACES_ID",            null: false
    t.string  "VINCULO",       limit: 60, null: false
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "INTERFACES_POR_ROLES", ["INTERFACES_ID"], name: "FK_RELATIONSHIP_93", using: :btree

  create_table "INVENTARIOS", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID",             null: false
    t.string  "PRODUCTO_ID",    limit: 20
    t.date    "FECHA_INGRESO",             null: false
    t.string  "NUMERO_FACTURA", limit: 20, null: false
    t.string  "STATUS",         limit: 1,  null: false
  end

  add_index "INVENTARIOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_26", using: :btree
  add_index "INVENTARIOS", ["PRODUCTO_ID"], name: "FK_RELATIONSHIP_30", using: :btree

  create_table "JUNTAS_DE_CONDOMINIOS", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "STATUS",        limit: 1, null: false
  end

  add_index "JUNTAS_DE_CONDOMINIOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_39", using: :btree

  create_table "LICENCIAS", primary_key: "ID", force: true do |t|
    t.integer "TIPO_LICENCIA_ID"
    t.integer "CONDOMINIO_ID"
    t.date    "FECHA_SOLICITUD",                     null: false
    t.date    "FECHA_ACTIVACION",                    null: false
    t.string  "ESTADO",                  limit: 1,   null: false
    t.float   "TIEMPO_DURACION"
    t.float   "COSTO"
    t.string  "CEDULA_PERSONA_CONTACTO", limit: 8,   null: false
    t.string  "NOMBRE_PC",               limit: 60,  null: false
    t.string  "APELLIDO_PC",             limit: 60,  null: false
    t.string  "DIRECCION_PC",            limit: 100
    t.string  "EMAIL_PC",                limit: 60,  null: false
    t.string  "TELEFONO_PC",             limit: 14
    t.string  "CELULAR_PC",              limit: 14,  null: false
    t.string  "STATUS",                  limit: 1,   null: false
  end

  add_index "LICENCIAS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_81", using: :btree

  create_table "NOTIFICACIONES", primary_key: "ID", force: true do |t|
    t.integer "ROL_ID",                null: false
    t.string  "DESCRIPCION",           null: false
    t.date    "FECHA",                 null: false
    t.string  "STATUS",      limit: 1
  end

  create_table "NOTIFICACIONES_POR_ROLES", primary_key: "ID", force: true do |t|
    t.integer "NOTIFICACION_ID",           null: false
    t.integer "ROL_ID",                    null: false
    t.string  "STATUS",          limit: 1, null: false
  end

  add_index "NOTIFICACIONES_POR_ROLES", ["NOTIFICACION_ID"], name: "FK_RELATIONSHIP_105", using: :btree

  create_table "NOVEDADES", primary_key: "ID", force: true do |t|
    t.string  "CEDULA",             limit: 8,  null: false
    t.string  "NOMBRE",             limit: 60, null: false
    t.string  "APELLIDO",           limit: 60, null: false
    t.string  "PLACA_VEHICULO",     limit: 10
    t.string  "DESCRIPCION"
    t.date    "ENTRADA",                       null: false
    t.date    "SALIDA",                        null: false
    t.integer "INMUEBLE_ID"
    t.integer "EMPLEADO_ID"
    t.integer "TIPO_NOVEDADES_ID"
    t.string  "PUBLICAR_CARTELERA", limit: 1
    t.string  "STATUS",             limit: 1,  null: false
  end

  add_index "NOVEDADES", ["INMUEBLE_ID"], name: "FK_RELATIONSHIP_53", using: :btree
  add_index "NOVEDADES", ["TIPO_NOVEDADES_ID"], name: "FK_RELATIONSHIP_42", using: :btree

  create_table "PERSONAS", primary_key: "ID", force: true do |t|
    t.string "CEDULA",                limit: 10,         null: false
    t.string "NOMBRE",                limit: 60,         null: false
    t.string "APELLIDO",              limit: 60,         null: false
    t.string "DIRECCION_ALTERNATIVA",                    null: false
    t.string "TELEFONO",              limit: 12
    t.string "CELULAR",               limit: 12,         null: false
    t.string "EMAIL",                 limit: 20,         null: false
    t.string "SEXO",                  limit: 1,          null: false
    t.date   "FECHA_NACIMIENTO",                         null: false
    t.binary "FOTO",                  limit: 2147483647, null: false
    t.string "ESTADO_CIVIL",          limit: 1
  end

  create_table "PRODUCTOS", primary_key: "ID", force: true do |t|
    t.integer "TIPO_PRODUCTO_ID",            null: false
    t.string  "NOMBRE",           limit: 60, null: false
    t.string  "DESCRIPCION",                 null: false
    t.float   "CANTIDAD_ACTUAL",             null: false
    t.float   "STOCK_MINIMO",                null: false
    t.float   "STOCK_MAXIMO",                null: false
    t.string  "STATUS",           limit: 1,  null: false
  end

  add_index "PRODUCTOS", ["TIPO_PRODUCTO_ID"], name: "FK_RELATIONSHIP_25", using: :btree

  create_table "PRODUCTOS_POR_COTIZACIONES", id: false, force: true do |t|
    t.integer "PRODUCTO_ID",                    null: false
    t.integer "COTIZACION_ID",                  null: false
    t.float   "CANTIDAD",                       null: false
    t.float   "PRECIO_UNITARIO",                null: false
    t.float   "PORCENTAJE_DESCUENTO"
    t.string  "STATUS",               limit: 1, null: false
  end

  add_index "PRODUCTOS_POR_COTIZACIONES", ["PRODUCTO_ID"], name: "FK_RELATIONSHIP_34", using: :btree

  create_table "PRODUCTOS_POR_REQUISICIONES", id: false, force: true do |t|
    t.integer "PRODUCTO_ID",              null: false
    t.integer "REQUISICION_ID",           null: false
    t.float   "CANTIDAD",                 null: false
    t.string  "STATUS",         limit: 1, null: false
  end

  add_index "PRODUCTOS_POR_REQUISICIONES", ["PRODUCTO_ID"], name: "FK_RELATIONSHIP_36", using: :btree

  create_table "PROPIETARIOS", primary_key: "ID", force: true do |t|
    t.string  "NOMBRE",                   limit: 60
    t.string  "APELLIDO",                 limit: 60
    t.string  "DIRECCION_ALTERNATIVA"
    t.string  "TELEFONO",                 limit: 12
    t.string  "CELULAR",                  limit: 12
    t.string  "EMAIL",                    limit: 20
    t.string  "SEXO",                     limit: 1
    t.date    "FECHA_NACIMIENTO"
    t.string  "ESTADO_CIVIL",             limit: 1
    t.string  "CEDULA",                   limit: 10,         null: false
    t.binary  "FOTO",                     limit: 2147483647, null: false
    t.integer "CONDOMINIO_ID"
    t.integer "USUARIOS_ID",                                 null: false
    t.integer "CARGO_JUNTA_ONDOMINIO_ID"
    t.string  "STATUS",                   limit: 1,          null: false
  end

  add_index "PROPIETARIOS", ["CARGO_JUNTA_ONDOMINIO_ID"], name: "FK_RELATIONSHIP_100", using: :btree
  add_index "PROPIETARIOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_8", using: :btree
  add_index "PROPIETARIOS", ["USUARIOS_ID"], name: "FK_RELATIONSHIP_86", using: :btree

  create_table "PROPIETARIOS_POR_ASAMBLEA", id: false, force: true do |t|
    t.integer "PROPIETARIO_ID",                 null: false
    t.integer "ASAMBLEA_DE_JUNTA_ID",           null: false
    t.string  "STATUS",               limit: 1, null: false
  end

  add_index "PROPIETARIOS_POR_ASAMBLEA", ["ASAMBLEA_DE_JUNTA_ID"], name: "FK_RELATIONSHIP_46", using: :btree

  create_table "PROVEEDORES", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60, null: false
    t.string  "DIRECCION",                null: false
    t.string  "TELEFONO",      limit: 12
    t.string  "CELULAR",       limit: 12, null: false
    t.string  "EMAIL",         limit: 30
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "PROVEEDORES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_31", using: :btree

  create_table "RECIBOS_CONDOMINIOS", primary_key: "ID", force: true do |t|
    t.integer "FACTURAS_ID"
    t.integer "INMUEBLE_ID"
    t.string  "DESCRIPCION"
    t.date    "FECHA_EMISION"
    t.date    "FECHA_CANCELACION"
    t.string  "STATUS",            limit: 1, null: false
  end

  add_index "RECIBOS_CONDOMINIOS", ["FACTURAS_ID"], name: "FK_RELATIONSHIP_60", using: :btree
  add_index "RECIBOS_CONDOMINIOS", ["INMUEBLE_ID"], name: "FK_RELATIONSHIP_59", using: :btree

  create_table "RECIBOS_GASTOS_EXTRAS", primary_key: "ID", force: true do |t|
    t.integer "GASTOS_ID"
    t.string  "DESCRIPCION"
    t.date    "FECHA_EMISION"
    t.date    "FECHA_CANCELACION"
    t.string  "STATUS",            limit: 1, null: false
  end

  add_index "RECIBOS_GASTOS_EXTRAS", ["GASTOS_ID"], name: "FK_RELATIONSHIP_74", using: :btree

  create_table "RECIBOS_RESERVACIONES", primary_key: "ID", force: true do |t|
    t.integer "RESERVACIONES_ID"
    t.string  "OBSERVACION"
    t.date    "FECHA_EMISION"
    t.string  "STATUS",           limit: 1, null: false
  end

  add_index "RECIBOS_RESERVACIONES", ["RESERVACIONES_ID"], name: "FK_RELATIONSHIP_96", using: :btree

  create_table "RECIBOS_SANCIONES", primary_key: "ID", force: true do |t|
    t.integer "SANCION_ID"
    t.string  "DESCRIPCION"
    t.date    "FECHA_EMISION"
    t.date    "FECHA_CANCELACION"
    t.string  "STATUS",            limit: 1, null: false
  end

  add_index "RECIBOS_SANCIONES", ["SANCION_ID"], name: "FK_RELATIONSHIP_97", using: :btree

  create_table "RENOVACIONES", primary_key: "ID", force: true do |t|
    t.integer "LICENCIA_ID",                null: false
    t.date    "FECHA_RENOVACION",           null: false
    t.float   "COSTO"
    t.string  "STATUS",           limit: 1, null: false
  end

  add_index "RENOVACIONES", ["LICENCIA_ID"], name: "FK_RELATIONSHIP_82", using: :btree

  create_table "REQUISICIONES", primary_key: "ID", force: true do |t|
    t.string "PROVEEDOR_ID", limit: 20
    t.date   "FECHA",                   null: false
    t.string "STATUS",       limit: 1,  null: false
  end

  add_index "REQUISICIONES", ["PROVEEDOR_ID"], name: "FK_RELATIONSHIP_38", using: :btree

  create_table "RESERVACIONES", primary_key: "ID", force: true do |t|
    t.integer "INMUEBLE_ID"
    t.integer "AREA_ID"
    t.date    "FECHA_RESERVACION",           null: false
    t.date    "FECHA_USO",                   null: false
    t.time    "HORA_INICIO",                 null: false
    t.time    "HORA_FINAL",                  null: false
    t.string  "STATUS",            limit: 1, null: false
  end

  add_index "RESERVACIONES", ["AREA_ID"], name: "FK_RELATIONSHIP_19", using: :btree
  add_index "RESERVACIONES", ["INMUEBLE_ID"], name: "FK_RELATIONSHIP_18", using: :btree

  create_table "ROLES", primary_key: "ID", force: true do |t|
    t.string "NOMBRE",      limit: 60, null: false
    t.string "DESCRIPCION"
    t.string "STATUS",      limit: 1,  null: false
  end

  create_table "SANCIONES", primary_key: "ID", force: true do |t|
    t.integer "INMUEBLE_ID"
    t.integer "TIPO_SANCIONES_ID"
    t.string  "DESCRIPCION",                 null: false
    t.date    "FECHA_REALIZACION",           null: false
    t.string  "CONDICION",         limit: 1, null: false
    t.string  "STATUS",            limit: 1, null: false
  end

  add_index "SANCIONES", ["INMUEBLE_ID"], name: "FK_RELATIONSHIP_15", using: :btree
  add_index "SANCIONES", ["TIPO_SANCIONES_ID"], name: "FK_RELATIONSHIP_16", using: :btree

  create_table "SERVICIOS_COMUNES", primary_key: "ID", force: true do |t|
    t.integer "TIPO_SERVICIOS_ID"
    t.date    "FECHA"
    t.float   "COSTO"
    t.binary  "RECIBO",            limit: 2147483647
    t.string  "STATUS",            limit: 1,          null: false
  end

  add_index "SERVICIOS_COMUNES", ["TIPO_SERVICIOS_ID"], name: "FK_RELATIONSHIP_55", using: :btree

  create_table "SOPORTES_DE_RECIBOS_PAGOS", primary_key: "ID", force: true do |t|
    t.integer "RECIBOS_CONDOMINIO_ID"
    t.integer "RECIBOS_RESERVACION_ID"
    t.integer "RECIBOS_GASTOS_EXTRAS_ID"
    t.integer "RECIBOS_SANCION_ID"
    t.string  "DESCRIPCION",                                 null: false
    t.string  "BANCO",                    limit: 60,         null: false
    t.date    "FECHA",                                       null: false
    t.float   "MONTO",                                       null: false
    t.string  "VALIDAR_PAGO",             limit: 1,          null: false
    t.binary  "COMPROBANTE",              limit: 2147483647, null: false
    t.string  "STATUS",                   limit: 1,          null: false
  end

  add_index "SOPORTES_DE_RECIBOS_PAGOS", ["RECIBOS_CONDOMINIO_ID"], name: "FK_RELATIONSHIP_75", using: :btree
  add_index "SOPORTES_DE_RECIBOS_PAGOS", ["RECIBOS_GASTOS_EXTRAS_ID"], name: "FK_RELATIONSHIP_80", using: :btree
  add_index "SOPORTES_DE_RECIBOS_PAGOS", ["RECIBOS_RESERVACION_ID"], name: "FK_RELATIONSHIP_61", using: :btree
  add_index "SOPORTES_DE_RECIBOS_PAGOS", ["RECIBOS_SANCION_ID"], name: "FK_RELATIONSHIP_87", using: :btree

  create_table "SUGERENCIAS", primary_key: "ID", force: true do |t|
    t.integer "INMUEBLE_ID"
    t.string  "DESCRIPCION",           null: false
    t.date    "FECHA",                 null: false
    t.string  "LEIDA",       limit: 1, null: false
    t.string  "PROPIETARIO", limit: 1, null: false
    t.string  "STATUS",      limit: 1, null: false
  end

  add_index "SUGERENCIAS", ["INMUEBLE_ID"], name: "FK_RELATIONSHIP_51", using: :btree

  create_table "TIPOS_EMPLEADOS", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",                 limit: 60, null: false
    t.string  "DESCRIPCION"
    t.float   "SUELDO_BASE",                       null: false
    t.float   "PORCENTAJE_PRIMA_HIJOS"
    t.string  "STATUS",                 limit: 1,  null: false
  end

  add_index "TIPOS_EMPLEADOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_12", using: :btree

  create_table "TIPOS_GASTOS_EXTRAS", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60
    t.string  "DESCRIPCION"
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "TIPOS_GASTOS_EXTRAS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_73", using: :btree

  create_table "TIPOS_INMUEBLES", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60, null: false
    t.string  "DESCRIPCION"
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "TIPOS_INMUEBLES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_49", using: :btree

  create_table "TIPOS_LICENCIAS", primary_key: "ID", force: true do |t|
    t.string "NOMBRE", limit: 60, null: false
    t.float  "COSTO",             null: false
    t.string "STATUS", limit: 1,  null: false
  end

  create_table "TIPOS_NOVEDADES", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60
    t.string  "DESCRIPCION"
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "TIPOS_NOVEDADES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_52", using: :btree

  create_table "TIPOS_PAGOS", primary_key: "ID", force: true do |t|
    t.string "NOMBRE",      limit: 60, null: false
    t.string "DESCRIPCION"
    t.string "ESTATUS",     limit: 1,  null: false
  end

  create_table "TIPOS_PRODUCTOS", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60, null: false
    t.string  "DESCRIPCION"
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "TIPOS_PRODUCTOS", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_44", using: :btree

  create_table "TIPOS_SERVICIOS_COMUNES", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60
    t.string  "DESCRIPCION"
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "TIPOS_SERVICIOS_COMUNES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_54", using: :btree

  create_table "TIPO_SANCIONES", primary_key: "ID", force: true do |t|
    t.integer "CONDOMINIO_ID"
    t.string  "NOMBRE",        limit: 60, null: false
    t.string  "DESCRIPCION"
    t.float   "MONTO"
    t.string  "PENALIZACION"
    t.string  "STATUS",        limit: 1,  null: false
  end

  add_index "TIPO_SANCIONES", ["CONDOMINIO_ID"], name: "FK_RELATIONSHIP_17", using: :btree

  create_table "USUARIOS", primary_key: "ID", force: true do |t|
    t.string "LOGIN",    limit: 10, null: false
    t.string "PASSWORD", limit: 10, null: false
    t.string "STATUS",   limit: 1,  null: false
  end

end

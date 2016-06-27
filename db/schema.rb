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

ActiveRecord::Schema.define(version: 20160627151233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_adoptar_fotos", force: :cascade do |t|
    t.string   "imagen"
    t.integer  "animal_adoptar_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "animal_adoptar_fotos", ["animal_adoptar_id"], name: "index_animal_adoptar_fotos_on_animal_adoptar_id", using: :btree

  create_table "animal_adoptars", force: :cascade do |t|
    t.string   "tipo"
    t.string   "raza"
    t.string   "genero"
    t.string   "descripcion"
    t.string   "edad"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "rescatado"
  end

  create_table "datos_personals", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nacimiento"
    t.boolean  "sexo"
    t.string   "telefono"
    t.string   "celular"
    t.string   "direccion"
    t.string   "estado"
    t.string   "ciudad"
    t.integer  "calificacion"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "correo_alternativo"
  end

  create_table "servicios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "ciudad"
    t.string   "estado"
    t.text     "descripcion"
    t.string   "logo"
    t.string   "correo1"
    t.string   "correo2"
    t.integer  "calificacion"
    t.integer  "tipo_servicio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "telefono1"
    t.string   "telefono2"
    t.string   "celular1"
    t.string   "celular2"
  end

  add_index "servicios", ["tipo_servicio_id"], name: "index_servicios_on_tipo_servicio_id", using: :btree

  create_table "tipo_servicios", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "animal_adoptar_fotos", "animal_adoptars"
  add_foreign_key "servicios", "tipo_servicios"
end

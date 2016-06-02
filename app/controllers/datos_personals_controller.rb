class DatosPersonalsController < ApplicationController

include CodigosGenerales
before_action :set_datos_personal,only: [:show, :edit, :update, :destroy]
before_action :cargarOpcionesDelMenuServicios

  def index
  end

  def new
  @datos_personal = DatosPersonal.new
  end

  def create
    #puts params[:datos_personal][:nombre]
    #render :text => params[:datos_personal].inspect

     @datos_personal = DatosPersonal.new(datos_personal_params)

      respond_to do |format|
      if @datos_personal.save
        format.html { redirect_to @datos_personal, notice: 'Datos personales agregados exitosamente.' }
        format.json { render :show, status: :created, location: @datos_personal }
      else
        format.html { render :new }
        format.json { render json: @datos_personal.errors, status: :unprocessable_entity }
      end
    end 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def datos_personal_params
      params.require(:datos_personal).permit(:nombre, :apellido, :fecha_nacimiento, :sexo, :telefono, :celular, :direccion, :estado, :ciudad, :calificacion, :correo_alternativo)
  end

  def show
    puts "show"
  end

  def set_datos_personal
  @datos_personal = DatosPersonal.find(params[:id])
  end


end
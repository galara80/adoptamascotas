class AnimalAdoptarsController < ApplicationController

  before_action :set_animal_adoptar, only: [:edit, :update, :destroy]

  include CodigosGenerales

  before_action :cargarOpcionesDelMenuServicios

  def index
     @animal_adoptars=AnimalAdoptar.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @animal_adoptar = AnimalAdoptar.find(params[:id])
  end

  def new
    @animal_adoptar = AnimalAdoptar.new
    @animal_adoptar.animal_adoptar_fotos.build
  end

  # POST /animal_adoptars
  # POST /animal_adoptars.json
  def create
    @animal_adoptar = AnimalAdoptar.new(animal_adoptar_params)

    respond_to do |format|
      if @animal_adoptar.save
        format.html { redirect_to @animal_adoptar, notice: 'Animal adoptar was successfully created.' }
        format.json { render :show, status: :created, location: @animal_adoptar }
      else
        format.html { render :new }
        format.json { render json: @animal_adoptar.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
        @animal_adoptar.animal_adoptar_fotos.build
  end

  # PATCH/PUT /animal_adoptars/1
  # PATCH/PUT /animal_adoptars/1.json
  def update
    respond_to do |format|
      if @animal_adoptar.update(animal_adoptar_params)
        format.html { redirect_to @animal_adoptar, notice: 'Animal adoptar was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal_adoptar }
      else
        format.html { render :edit }
        format.json { render json: @animal_adoptar.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /animal_adoptars/1
  # DELETE /animal_adoptars/1.json
  def destroy
    @animal_adoptar.destroy
    respond_to do |format|
      format.html { redirect_to animal_adoptars_url, notice: 'Animal adoptar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_adoptar
      @animal_adoptar = AnimalAdoptar.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_adoptar_params
      params.require(:animal_adoptar).permit(:tipo, :raza, :genero, :edad, :descripcion, animal_adoptar_fotos_attributes:[:id, :imagen, :_destroy])
    end

end
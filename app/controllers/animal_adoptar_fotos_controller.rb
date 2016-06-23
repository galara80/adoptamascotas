class AnimalAdoptarFotosController < ApplicationController

    before_action :set_animal_adoptar, only: [:edit, :update, :destroy]

  include CodigosGenerales

  before_action :cargarOpcionesDelMenuServicios
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

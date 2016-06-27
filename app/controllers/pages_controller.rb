class PagesController < ApplicationController

	layout :colocar_layout
  def home
  	@tipo_servicios = TipoServicio.all
  end

  def index
  end

  def colocar_layout

  	if usuario_signed_in?
  		"administrador"
  	else
  		"application"
  	end
  end
  
end

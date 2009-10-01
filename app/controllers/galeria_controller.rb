class GaleriaController < ApplicationController
  def index
    @galerie = Galeria.find(:all)
  end
  
  def show
    @galeria = Galeria.find_by_permalink(params[:id])
    @fotografie = Fotografia.find(@galeria.katalog)
  end
end

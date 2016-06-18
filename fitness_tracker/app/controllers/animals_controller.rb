class AnimalsController < ApplicationController

	include ConversionHelper

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)    
    if @animal.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @metric = is_metric?(params[:metric])
    @height = convert_height(@animal, @metric)
    @weight = convert_weight(@animal, @metric)
  end

  private

  # A stronng params for Animal
  def animal_params
    params.require(:animal).permit(:name, :description, :height, :weight, :metric)
  end

end

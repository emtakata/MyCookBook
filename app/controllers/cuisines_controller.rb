class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    cuisine_params = params.require(:cuisine).permit(:name)
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      redirect_to cuisine_path(@cuisine)
    else
      flash[:error] = 'Deu ruim!!'
      render :new
    end
  end
end

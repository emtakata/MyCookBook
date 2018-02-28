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

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    cuisine_params = params.require(:cuisine).permit(:name)

    @cuisine = Cuisine.find(params[:id])

    if @cuisine.update(cuisine_params)
      redirect_to cuisine_path(@cuisine)
    else
      flash[:error] = 'Deu ruim!!'
      render :edit
    end
  end
end

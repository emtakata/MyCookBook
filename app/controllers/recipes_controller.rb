class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
  end

  def create
    recipe_params = params.require(:recipe).permit(
      :title, :recipe_type, :method, :ingredients, :cuisine_id,
      :cook_time, :difficulty
     )

    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      @cuisines = Cuisine.all
      render :new
    end
  end
end
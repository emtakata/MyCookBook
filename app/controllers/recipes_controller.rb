class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe_params = params.require(:recipe).permit(
      :title, :recipe_type, :method, :ingredients, :cuisine,
      :cook_time, :difficulty
     )
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end
end

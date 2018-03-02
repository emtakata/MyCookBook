class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

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

  def edit
    @recipe = Recipe.find(params[:id])
    @cuisines = Cuisine.all
  end

  def update
    recipe_params = params.require(:recipe).permit(
      :title, :recipe_type, :method, :ingredients, :cuisine_id,
      :cook_time, :difficulty
     )

     @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:error] = 'Todos os campos são obrigatórios!'
      @cuisines = Cuisine.all
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to root_path
  end

  def search
    @search = params[:q]
    @recipes = Recipe.where("title LIKE ?", "%#{@search}%")
    if @recipes.empty?
      @not_found = 'Nenhum resultado encontrado'
    end
  end
end

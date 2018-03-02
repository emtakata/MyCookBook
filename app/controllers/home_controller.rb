class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(6)
    @cuisines = Cuisine.all
  end
end

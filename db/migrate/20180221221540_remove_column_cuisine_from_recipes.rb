class RemoveColumnCuisineFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :cuisine
  end
end

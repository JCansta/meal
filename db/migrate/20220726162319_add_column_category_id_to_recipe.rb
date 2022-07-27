class AddColumnCategoryIdToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :category, index: true
  end
end

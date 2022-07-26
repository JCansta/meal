class CreateRecipe < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :category
      t.string :instruction
      t.string :image
      t.integer :clap, default: 0, null: false
    end
  end
end

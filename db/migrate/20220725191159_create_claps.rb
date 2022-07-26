class CreateClaps < ActiveRecord::Migration[6.1]
  def change
    create_table :claps do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

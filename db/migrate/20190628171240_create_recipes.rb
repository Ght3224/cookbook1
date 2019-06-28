class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :prep_time
      t.string :integer

      t.timestamps
    end
  end
end

class CreateRecipesCategories < ActiveRecord::Migration
  def self.up
    create_table :recipes_categories, :id=> false do |t|
      t.references :recipe
      t.references :category
    end
  end

  def self.down
    drop_table :recipes_categories
  end
end

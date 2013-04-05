class AddTypeToRatingCategories < ActiveRecord::Migration
  def change
    add_column :rating_categories, :type, :string
  end
end

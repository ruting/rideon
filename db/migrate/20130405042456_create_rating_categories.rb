class CreateRatingCategories < ActiveRecord::Migration
  def change
    create_table :rating_categories do |t|
      t.string :title
      t.timestamps
    end
  end
end

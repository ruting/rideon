class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :transport # BUS / CAR / TAXI
      t.decimal :price
      t.integer :min
      t.integer :max
      t.date :date
      t.time :time
      t.boolean :allowed
      t.integer :user_id

      t.timestamps
    end
  end
end

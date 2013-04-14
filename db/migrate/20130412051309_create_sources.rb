class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.belongs_to :route
      t.string :address
      t.float :latitude 
      t.float :longitude
      t.time :time

      t.timestamps
    end
  end
end

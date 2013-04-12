class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.belongs_to :route
      t.float :coordinate
      t.time :time
      t.timestamps
    end
  end
end

class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.belongs_to :route
      t.float :coordinate
      t.time :time

      t.timestamps
    end
  end
end

class AddProfileToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.references :profile, :polymorphic => true
    end
  end

  def self.down
    change_table :users do |t|
      t.remove_references :profile, :polymorphic => true
    end
  end



end

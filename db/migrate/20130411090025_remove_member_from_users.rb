class RemoveMemberFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :dob
  end

  def down
    add_column :users, :dob, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
  end
end

class AddAttachmentAvatarToRatingCategories < ActiveRecord::Migration
  def self.up
    change_table :rating_categories do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :rating_categories, :avatar
  end
end

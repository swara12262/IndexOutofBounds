class AddAttachmentImageToUserdetails < ActiveRecord::Migration
  def self.up
    change_table :userdetails do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :userdetails, :image
  end
end

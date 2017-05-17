class Userdetail < ApplicationRecord
	
	has_attached_file :image, styles: { medium: "50x50#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	belongs_to :user

end

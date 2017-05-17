class Project < ApplicationRecord
	belongs_to :user
	validates :title,:technology, :presence => true
	validates :title,:technology, :length => {:minimum => 4}
end

class Question < ApplicationRecord

	belongs_to :user
	has_many :answers, dependent: :destroy
	belongs_to :subject
	validates :userquestion, :presence => true
	validates :userquestion, :length => {:minimum => 9}
	validates :userquestion, :uniqueness =>true
end

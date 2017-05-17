class Answer < ApplicationRecord
	belongs_to :user 
	belongs_to :question 
	has_many :likes, dependent: :destroy
	has_many :dislikes, dependent: :destroy

	validates :useranswer, :presence => true
	validates :useranswer, :length => {:minimum => 10}
	validates :useranswer, :uniqueness =>true
end

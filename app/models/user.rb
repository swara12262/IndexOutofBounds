class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

	 has_many :subjects, dependent: :destroy
	 has_many :questions, dependent: :destroy
	 has_many :answers, dependent: :destroy
   has_many :projects, dependent: :destroy
   has_one :userdetail, dependent: :destroy
   has_one :like, dependent: :destroy
   has_one :dislike, dependent: :destroy
end

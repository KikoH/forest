class User < ActiveRecord::Base
	has_many :reviews
	has_many :products, through: :reviews
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true
	validates :email, format: {with: /\@/, message: " format is incorrect. Should be your_email@domain.com"}
end

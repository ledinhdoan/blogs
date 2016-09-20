class User < ActiveRecord::Base
	has_many :post, dependent: :destroy
  	has_many :comments, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
end

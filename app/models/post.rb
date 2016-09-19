class Post < ActiveRecord::Base
	has_many :comments, dependent: destroy
	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true
end

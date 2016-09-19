class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true
end

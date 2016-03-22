class Article < ActiveRecord::Base
	has_many :comments, :as => :commentable
	scope :search, lambda { |query|
		where(["title like ?","%#{query}%"])} 
end

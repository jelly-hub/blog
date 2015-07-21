class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy #Article has many comments, and if an article is destroyed, its comments have to be destroyed as well.
	validates :title, presence: true, length: {minimum: 5} #Title has to be present and at least with a length of 5

end

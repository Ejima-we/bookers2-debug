class Book < ApplicationRecord
	belongs_to :user
	
	def self.search(search, word)
		if search == "forward_match"
			@book = Book.where("title LIKE?", "#{word}%")
		elsif search == "backward_match"
			@book = Book.where("title LIKE?", "%#{word}")
		elsif search == "perfect_match"
			@book == Book.where("#{word}")
		elsif search == "partial_match"
			@book = Book.where("title LIKE?", "%#{word}%")
		end
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end

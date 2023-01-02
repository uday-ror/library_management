class Book < ApplicationRecord
	has_one_attached :image
	belongs_to :plan
	 validates :title, presence: true
 	 validates :author, presence: true
end


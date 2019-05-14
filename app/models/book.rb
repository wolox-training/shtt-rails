class Book < ApplicationRecord
  has_many :rent
  validates :gender, :author, :image, :title, :editor, :year, presence: true
end

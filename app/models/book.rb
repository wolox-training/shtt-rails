class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  validates :gender, :author, :image, :title, :editor, :year, presence: true
end

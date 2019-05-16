class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  validates :genre, :author, :image, :title, :editor, :year, presence: true

  def current_rent
    Rent.where(book_id: id).current.first
  end

  def image_url
    image
  end
end

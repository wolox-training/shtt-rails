class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  validates :genre, :author, :image, :title, :editor, :year, presence: true

  def actual_rent
    rents.each do |rent|
      return rent if Time.zone.today.between?(rent.start_date_rent, rent.end_date_rent)
    end
  end

  def image_url
    image
  end
end

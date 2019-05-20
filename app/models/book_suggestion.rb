class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates_associated :user
  validates :author, :link, :title, :editor, :year, presence: true
end

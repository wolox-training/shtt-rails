class BookSerializer < ApplicationSerializer
  attributes :id, :author, :title, :image_url, :editor, :year, :genre
end

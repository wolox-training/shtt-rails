class ChangeLimitTitleToBook < ActiveRecord::Migration[5.1]
  def up
    books = Book.where('length(title) > 25')
    books.each do |book|
      book.update(title: "#{book.title.slice(0, 22)}...")
    end
    change_column :books, :title, :string, limit: 25
  end
end

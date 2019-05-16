class ChangeGenderName < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :gender, :genre
  end
end

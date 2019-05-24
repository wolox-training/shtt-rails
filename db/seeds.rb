# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50_000.times do
  Book.create(
    genre: Faker::Book.genre,
    author: Faker::Book.author,
    image: Faker::File.file_name('path/to'),
    title: "#{Faker::Book.title.slice(0, 22)}...",
    editor: Faker::Book.publisher,
    year: Faker::Number.number(4)
  )
end

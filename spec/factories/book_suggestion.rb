require 'faker'
FactoryBot.define do
  factory :book_suggestion do
    author { Faker::Book.author }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Number.number(4) }
    link { Faker::Internet.url }
  end
end

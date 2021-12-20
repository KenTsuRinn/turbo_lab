# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
60.times do |_t|
  Twitter.create(content: Faker::Lorem.paragraph(sentence_count: 5), user: Faker::Name.name,
                 like: Faker::Number.digit, dislike: Faker::Number.digit, created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
                 updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now))
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザの生成
1.times do |n|
  confirmed_at = Time.now - 100
  User.create!(
    # Faker::Movies::LordOfTheRings.character で生成
    name:     "Tom Bombadil",
    email:    "tBombadil@example.org",
    password: "Quickbeam",
    confirmed_at: confirmed_at
  )
end

29.times do |n|
  name  = Faker::Creature::Cat.unique.breed
  email = "example-#{n+1}@example.org"
  # パスワードは Faker::Movies::StarWars.planet で生成
  password = "Takodana"
  confirmed_at = Time.now - 100
  User.create!(
    name:  name,
    email: email,
    password: password,
    confirmed_at: confirmed_at
  )
end

# 記事の生成
users = User.order(:created_at).take(6)
20.times do
  title = "This article is test." 
  text  = Faker::Quote.yoda
  users.each { |user| user.articles.create!(title: title, text: text) }
end

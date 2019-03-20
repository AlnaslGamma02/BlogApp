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
    username: "Tom Bombadil",
    email:    "tBombadil@example.org",
    password: "Quickbeam",
    confirmed_at: confirmed_at
  )
end

29.times do |n|
  username  = Faker::Creature::Cat.unique.breed
  email = "example-#{n+1}@example.org"
  password = "Takodana"
  confirmed_at = Time.now - 100
  User.create!(
    username:  username,
    email: email,
    password: password,
    confirmed_at: confirmed_at
  )
end

# 記事の生成
users   = User.order(:created_at).take(6)
numbers = [0,1,2,3,4,5,6,7,8,9]
title   = "This article is test."

20.times do
  users.each do |user|
    text  = Faker::Quote.yoda
    num   = numbers.sample
    user.articles.create!(
      title: title,
      text: text,
      picture: open("#{Rails.root}/app/assets/images/image0#{num}.jpg")
    )
  end
end

# コメントの生成
users   = User.order(:created_at).take(3)

120.times do |n|
  id = n + 1
  users.each do |user|
    body = Faker::Movies::StarWars.quote
    user.comments.create!(
      body: body,
      article_id: id
    )
  end
end

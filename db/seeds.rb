User.create!(
  email: "johns@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: "Admin User",
  roles: "site_admin"
)
puts "1 Admin user created"

User.create!(
  email: "john@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: "Regular User",
)
puts "1 Reagular user created"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Technology.destroy_all
Portfolio.destroy_all
Skill.destroy_all
Blog.destroy_all


#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 3.times do |topic|
#   Topic.create!(
#     title: "Topic #{topic}"
#   )
# end

# 10.times do |blog|
#   Blog.create!(
#     title: Faker::Computer.platform,
#     body:Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
#     topic_id: Topic.last.id
#   )
# end

# puts "10 blog posts created"

# 5.times do |skill|
#   Skill.create!(
#     title: "Rails #{skill}",
#     percent_utilized: 15 
#   )
# end

# puts "5 skills created"

# 9.times do |portfolio_item|
#   Portfolio.create!(
#      title: "Portfolio title: #{portfolio_item}" ,
#      subtitle: "Ruby on Rails",
#      body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) ,
    
#   )
# end
# puts "9 postfolio items created"

# 1.times do |portfolio_item|
#   Portfolio.create!(
#      title: "Portfolio title: #{portfolio_item}" ,
#      subtitle: "Angular",
#      body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
#      main_image: "http://placehold.it/600x400" ,
#      thumb_image: "http://placehold.it/350x200"
#   )
# end
# puts "9 postfolio items created"


# 3.times do |technology|
#   Portfolio.last.technologies.create!(
#     name: "Technologies #{technology}"
#   )
# end
# puts "3 technologies creates"



3.times do |topic|
  Topic.create!(
    title: "#{Faker::Movies::HarryPotter.character} #{topic}"
  )
end

puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: Faker::Books::Lovecraft.paragraphs,
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skills created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: Faker::Books::Lovecraft.paragraphs,
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: Faker::Books::Lovecraft.paragraphs,
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3 technologies created"



10.times do |ingredient|
  Ingredient.create!(
    name: Faker::Food.ingredient,
    description: Faker::Food.description,
    price: Faker::Number.decimal(l_digits: 2) 
  )
end

puts "10 ingredient created"
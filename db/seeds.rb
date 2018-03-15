
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
AdminUser.destroy_all

12.times do |i|
	Product.create(
		name: Faker::Commerce.product_name,
		price: Faker::Commerce.price.to_i,
		photo: "https://loremflickr.com/320/240?random=#{i + 1}"
		)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

10.times do |i|
	User.create(email:"usuario#{i}@gmail.com", password: '123456')
end 

10.times do |i|
	Post.create(
		user: User.order("RANDOM()").first,
		title:Faker::Lorem.sentence,
		content: Faker::Lorem.paragraph)
end

20.times do |i|
	Comment.create(
		post: Post.order("RANDOM()").first,
		content: Faker::Lorem.paragraph)
end
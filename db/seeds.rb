
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
Product.destroy_all
AdminUser.destroy_all


12.times do |i|
	Product.create(
		name: Faker::Commerce.product_name,
		price: Faker::Commerce.price.to_i,
		photo: "#{i + 1}.jpg"
		#http://placeimg.com/200/200/tech
		)
end
AdminUser.create!(email: 'joselin.solis.3b@gmail.com', password: '123456', password_confirmation: '123456')




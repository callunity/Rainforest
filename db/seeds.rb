# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Product.destroy_all

User.create!({
  email: "example@bitmakerlabs.com",
  first_name: "Example",
  last_name: "User",
  password: "password",
  password_confirmation: "password"
  }
)

99.times do |n|
  Product.create!({
    name: Faker::Commerce.product_name,
    price_in_cents: rand(100..538750),
    description: Faker::Company.bs
  })
end
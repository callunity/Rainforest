# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create!(:name => "Chair", :description => "Has legs", :price_in_cents => 33000)
Product.create!(:name => "Column vaporizer", :description => "Gets rid of all of those annoying view-blocking columns", :price_in_cents => 4000000000)
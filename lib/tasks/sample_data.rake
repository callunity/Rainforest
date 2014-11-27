namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      name  = Faker::Commerce.product_name
      price = rand(100..538750)
      description  = Faker::Company.bs
    end
  end
end
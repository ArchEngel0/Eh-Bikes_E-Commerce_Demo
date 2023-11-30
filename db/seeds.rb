# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create categories
categories = ["E-Bike", "Storage", "Charger", "Battery", "Misc"]
categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Generate E-Bike products
100.times do
  name = Faker::Vehicle.make_and_model
  description = Faker::Lorem.paragraph
  sale = Faker::Boolean.boolean

  # Assign a random category to the product
  category = Category.all.sample
  product = Product.create!(
    name:,
    description:,
    sale:,
    category:
  )
end
